package com.aaron.ls.v2.bitswarm
{
	import com.IProtobuf.Message;
	import com.IProtobuf.MessageBuilder;
	import com.aaron.ls.v2.LightClinet;
	import com.aaron.ls.v2.controllers.ExtensionController;
	import com.aaron.ls.v2.controllers.SystemController;
	import com.aaron.ls.v2.events.BaseEvent;
	import com.aaron.ls.v2.events.LSEvent;
	import com.aaron.ls.v2.logging.Log;
	import com.aaron.ls.v2.logging.Logger;
	import com.aaron.ls.v2.net.WebSocketConnect;
	import com.aaron.ls.v2.net.WebSocketEvent;
	import com.aaron.ls.v2.proto.ClientDisconnectionReason;
	import com.aaron.ls.v2.proto.LProto;
	import com.aaron.ls.v2.proto.MSG;
	import com.aaron.ls.v2.proto.MessageID;
	import com.lightUI.core.Light;
	
	import laya.events.EventDispatcher;
	import laya.utils.Byte;

	public class BitSwarmClient extends EventDispatcher
	{
		private var _heartInterval:int = 3000;
		private var _heartStartTime:Array = [];
		private var _netSpeeds:Array = [];
		private var _heartBeat:int;
		private var _lastResponseTime:int = -1;
		private var _maxSessionIdleTime:int = 10;
		
		
		private var _systemController:SystemController;
		private var _extensionController:ExtensionController;
		private var _webSocket:WebSocketConnect;
		private var _proto:LProto;
		private var _exProto:Object;
		
		private var _maxMessageSize:int = 10000;				//最大消息长度
		
		private var _lastIpAddress:String;
		private var _lastTcpPort:int;
		
		private var _connected:Boolean = false;
		private var _isConnecting:Boolean = false;
		private var _attemptingReconnection:Boolean = false;	//是否正在尝试重连
		private var _reconnectionSeconds:int = 0;				//重连时间
		private var _firstReconnAttempt:Number = -1;			//开始尝试重连的时间
		private var _reconnCounter:int = 1;					//重连次数
		private var _reconnectionDelayMillis:int = 1000;
		
		private var _logger:Logger;
		
		
		private var _ls:LightClinet;
		
		public function BitSwarmClient(ls:LightClinet,proto:LProto,exProto:Object)
		{
			_webSocket = new WebSocketConnect();
			_proto = proto;
			_exProto = exProto;
			_ls = ls;
			
			this._logger = new Logger();
			
			_systemController = new SystemController(this,ls);
			_extensionController = new ExtensionController(this,ls);
			
			_webSocket.addEventListener(WebSocketEvent.CONNECT, this, onSocketConnect);
			_webSocket.addEventListener(WebSocketEvent.CONNECT_FAIL, this, onSocketConnectFail);
			_webSocket.addEventListener(WebSocketEvent.SOCKET_DATA,this,onMessageReveived);
			_webSocket.addEventListener(WebSocketEvent.CLOSE, this, onSocketClose);
		}
		
		
		private function onSocketClose(evt:BaseEvent):void{
			this._connected = false;
			stopHeart();
			//是否定期自动断线
			var isRegularDisconnection:Boolean = ((!(this._attemptingReconnection)) && ((this._ls.getReconnectionSeconds() == 0)));
			//是否是手动断线
			var isManualDisconnection:Boolean = (((evt is LSEvent)) && (((evt as LSEvent).data.reason == ClientDisconnectionReason.MANUAL)));
			if (((isRegularDisconnection) || (isManualDisconnection))){
				this._firstReconnAttempt = -1;
				this.executeDisconnection(evt);
				return;
			};
			if (this._attemptingReconnection){
				this.reconnect();
			} else {
				this._attemptingReconnection = true;
				this._firstReconnAttempt = Laya.timer.currTimer;
				this._reconnCounter = 1;
				_ls.event(LSEvent.CONNECTION_RETRY);
				this.reconnect();
			};
		}
		
		private function reconnect():void{
			trace("reconnect: ",_attemptingReconnection);
			if (!(this._attemptingReconnection)){
				return;
			};
			var reconnectionSeconds:* = (this._ls.getReconnectionSeconds() * 1000);
			var now:* = Laya.timer.currTimer;
			var timeLeft:* = ((this._firstReconnAttempt + reconnectionSeconds) - now);
			trace("timeLeft: ",timeLeft);
			if (timeLeft > 0){
				//this._ls.logger.info("Reconnection attempt:", this._reconnCounter, " - time left:", int((timeLeft / 1000)), "sec.");
				
				Light.timer.setTimeout(null,function ():void{
					connect(_lastIpAddress, _lastTcpPort);
				}, this._reconnectionDelayMillis,null);
				
				this._reconnCounter++;
			} else {
				trace("重连失败");
				_ls.event(LSEvent.DISCONNECT,ClientDisconnectionReason.UNKNOWN);
			};
		}
		
		/**
		 *连接服务器 
		 * @param host
		 * @param port
		 * 
		 */		
		public function connect(host:String,port:int):void
		{
			if (this._connected){
				_ls.logger.warn("Already connected");
				return;
			};
			if (this._isConnecting){
				_ls.logger.warn("A connection attempt is already in progress");
				return;
			};
			
			if ((((host == null)) || ((host.length == 0)))){
				throw new Error("Invalid connection host/address");
			};
			if ((((port < 0)) || ((port > 0xFFFF)))){
				throw new Error("Invalid connection port");
			};
			
			this._lastIpAddress = host;
			this._lastTcpPort = port;
			_webSocket.connect(host,port);
		}
		
		/**
		 * 断开连接 
		 * @param reason
		 * 
		 */		
		public function disconnect(reason:int=null):void{
			if (this._webSocket.connected){
				this._webSocket.close();
			};
			//this.onSocketClose(new WebSocketEvent(WebSocketEvent.CLOSE, {reason:reason}));
			this.onSocketClose(new LSEvent(LSEvent.DISCONNECT, {reason:reason}));
		}
		
		/**
		 * 强制关闭连接 
		 * 
		 */		
		public function killConnection():void{
			this._webSocket.close();
			this.onSocketClose(new WebSocketEvent(WebSocketEvent.CLOSE));
		}
		
		public function stopReconnection():void{
			this._attemptingReconnection = false;
			this._firstReconnAttempt = -1;
			if (this._webSocket.connected){
				this._webSocket.close();
			};
			this.executeDisconnection(null);
		}
		
		public function sendSystemMessage(msg:MSG):void{
			//Log.info("sendSystemMessage: ",msg);
			if(msg.msgid >= 200) throw new Error("系统消息必须小于200");
			_webSocket.sent(msg.encode().toBuffer());
		}
		
		public function sendExtendMessage(cmd:int,msg:Message):void{
			//Log.info("sendExtendMessage: ",msg);
			if(cmd < 200) throw new Error("扩展消息必须大于等于200");
			var request:MSG = _proto.getMSG();
			request.msgid = cmd;
			if(msg) request.extendMsg = msg.encode();
			_webSocket.sent(request.encode().toBuffer());
		}
		
		private function executeDisconnection(evt:BaseEvent):void{
			this._connected = false;
			if ((evt is LSEvent)){
				_ls.event(evt.type,evt.data.reason);
			} else {
				_ls.event(LSEvent.DISCONNECT,ClientDisconnectionReason.UNKNOWN);
			};
		}
		
		private function onSocketConnect(evt:WebSocketEvent):void{
			this._connected = true;
			this.event(LSEvent.CONNECTION,_attemptingReconnection);
			//开始心跳
			_heartBeat = startHeart();
		}
		
		private function onSocketConnectFail(evt:WebSocketEvent):void{
			
			if(this._ls.getReconnectionSeconds() == 0){
				trace("连接失败");
				_ls.event(LSEvent.CONNECT_FAIL);
			}else{
				if (this._attemptingReconnection){
					this.reconnect();
				} else {
					this._attemptingReconnection = true;
					this._firstReconnAttempt = Laya.timer.currTimer;
					this._reconnCounter = 1;
					_ls.event(LSEvent.CONNECTION_RETRY);
					this.reconnect();
				};
			}
		}
		
		private function startHeart():int{
			_lastResponseTime = Laya.timer.currTimer;
			return Light.timer.setInterval(this,heartHandler,_heartInterval,null);
		}
		
		private function stopHeart():void{
			if(_heartBeat > 0) {
				Light.timer.clearInterval(_heartBeat);
				_heartStartTime = [];
			}
		}
		
		private function heartHandler():void{
			//var msg:RqsMessage = new RqsMessage(MessageID.HEART_BEAT_REQIEST);
			
			var tempTime:int = Laya.timer.currTimer - _lastResponseTime;
			if(tempTime > _maxSessionIdleTime*1000){
				Log.info("心跳超时，掉线了 ",tempTime);
				stopHeart();
				this.disconnect(ClientDisconnectionReason.UNKNOWN);
				return;
			}
			_heartStartTime.push(Laya.timer.currTimer);
			
			
			var msg:MSG = _proto.getMSG();
			msg.msgid = MessageID.HEART_BEAT_REQIEST;
			sendSystemMessage(msg);
		}
		
		private function heartResponese():void{
			var startTime:int = _heartStartTime.shift();
			_lastResponseTime = Laya.timer.currTimer;
			var speed:int = _lastResponseTime - startTime;
			addSpeed(speed);
		}
		
		/**
		 * 获取网速 
		 * @return 
		 * 
		 */		
		public function getNetSpeed():int{
			var _speed:int = 0;
			var l:int = _netSpeeds.length;
			var sun:int = 0;
			for (var i:int = 0; i < l; i++) 
			{
				sun += _netSpeeds[i];
			}
			_speed = sun/i;
			return _speed;
		}
		
		private function addSpeed(speed:int):void{
			_netSpeeds.push(speed);
			_ls.event(LSEvent.NET_SPEED_UPDATA);
		}
		
		
		public function onMessageReveived(e:WebSocketEvent):void{
			
			var msgbyte:Byte = e.data as Byte;
			//var msg:MSG = _proto.MSG_Builer().decode(msgbyte.buffer);
			var msg:LSMessage;
			if(_exProto)
				msg = LSMessage.creatMessage(msgbyte,_proto.MSG_Builer() as MessageBuilder,_exProto.ExMSG_Builer() as MessageBuilder);
			else
				msg = LSMessage.creatMessage(msgbyte,_proto.MSG_Builer() as MessageBuilder,null);
			
			//trace("onMessageReveived",msg);
			
			if(msg.msgId == MessageID.HEART_BEAT_RESPONSE){
				//这里是心跳
				//trace("心跳： ",msg);
				heartResponese();
			} else{
				//Log.info("收到消息： ",JSON.stringify(msg));
				Log.info("收到消息： ",msg.msgId);
				if(msg.msgId >= 200){
					this.event(LSEvent.EXTENSION_RESPONSE,msg);
				}else{
					this.event(msg.msgId.toString(),msg);
				}
			}
		}
		
		public function get proto():LProto
		{
			return _proto;
		}

		public function set proto(value:LProto):void
		{
			_proto = value;
		}

		public function get isReconnecting():Boolean{
			return (this._attemptingReconnection);
		}
		public function set isReconnecting(value:Boolean):void{
			this._attemptingReconnection = value;
		}
		public function get reconnectionSeconds():int{
			return (this._reconnectionSeconds);
		}
		public function set reconnectionSeconds(seconds:int):void{
			if (seconds < 0){
				this._reconnectionSeconds = 0;
			} else {
				this._reconnectionSeconds = seconds;
			};
		}

		public function get maxMessageSize():int
		{
			return _maxMessageSize;
		}

		public function set maxMessageSize(value:int):void
		{
			_maxMessageSize = value;
		}
		public function get connected():Boolean{
			return (this._connected);
		}

		public function set maxSessionIdleTime(value:int):void
		{
			_maxSessionIdleTime = value;
		}

	}
}