package com.aaron.ls.v2.net
{
	import com.aaron.ls.v2.events.LSEvent;
	import com.iflash.events.EventDispatcher;
	import com.iflash.utils.ByteArray;
	import com.lightUI.core.Light;
	
	import laya.events.Event;
	import laya.net.Socket;
	import laya.utils.Browser;
	import laya.utils.Byte;

	public class SocketConnect extends EventDispatcher
	{
		private var _socket:Socket;
		private var _receiveBytes:ByteArray;
		private var _msgBytes:ByteArray;
		private var _sendBytes:ByteArray;
		
		private var _host:String;
		private var _port:int;
		
		private var _retryTimes:int = 3;//////////////////////////////-1为不断重连
		private var _currRetryTimes:int = 0;///////////////////////////当前连接的次数
		private var _interval:int   = 3000;////////////////////////////重连间隔
		
		
		
		public var isReConnect:Boolean = false;//////////////////////标记是否为重连
		public var name:String;
		
		private var _isConnectingError:Boolean = false;
		private var _isClose:Boolean = false;
		private var _isConneced:Boolean = false;//////////////////////是否是连接状态
		private var _isReConnecting:Boolean = false;//////////////////是否正在重连
		
		public function SocketConnect()
		{
			init();
		}
		
		private function init():void{
			_receiveBytes = new ByteArray();
			_sendBytes = new ByteArray();
			
			_socket = new Socket();
			
			_socket.endian = Socket.BIG_ENDIAN;
			
			_socket.on(Event.OPEN, this, onSocketOpen);
			_socket.on(Event.CLOSE, this, onSocketClose);
			_socket.on(Event.MESSAGE, this, onMessageReveived);
			_socket.on(Event.ERROR, this, onConnectError);
		}
		
		private function onConnectError():void
		{
			trace("onConnectError");
			
			_isConnectingError = true;
			//连接失败  会触发erro 和close  但顺序不能保证     所以当两个灯点燃后 再发送连接失败事件

			if(_isConnectingError && _isClose){
				sentEvent();
			}
		}
		
		private function sentEvent():void{
			trace("连接失败");
			
			//如果是重连阶段 就不触发连接失败的事件
			if(_isReConnecting) return;
			
			_isConnectingError = false;
			_isClose = false;
			this.dispatchEvent(new LSEvent(LSEvent.CONNECT_FAIL));
		}
		
		/**
		 *连接服务器 
		 * @param host
		 * @param port
		 * 
		 */		
		public function connect(host:String,port:int):void
		{
			_host = host;
			_port = port;
			
			_isConnectingError = false;
			_isClose = false;
			
			trace("[SocketConnect] ","connect",host,port,_currRetryTimes,_retryTimes);
			_socket.connect(host,port);
			
			//_currRetryTimes++;
			
			
		}
		
		/**
		 * 重连服务器 
		 * 
		 */		
		public function reConnect():void{
			_isReConnecting = true;
			
			this.dispatchEvent(new LSEvent(LSEvent.CONNECTION_RETRY));
			
			reConnectHandler();
		}
		
		private function reConnectHandler():void{
			
			_isConnectingError = false;
			_isClose = false;
			
			trace("[SocketConnect] ","reConnect",_host,_port,_currRetryTimes,_retryTimes);
			_socket.connect(_host,_port);
			
			if(++_currRetryTimes <_retryTimes)Light.timer.setTimeout(this,reConnectHandler,_interval,null);
		}
		
		public function sent(msg:ArrayBuffer):void{
			if(!_socket || !_socket.output) return;
			var _dataByte:Byte = new Byte(msg);
			(_socket.output as Byte).writeArrayBuffer(msg,0,msg.byteLength);
			_socket.flush();
		}
		
		public function close():void{
			_socket.close();
		}
		
		public function isConnected():Boolean{
			return _socket.connected;
		}
		
		private var _lengthNeedReceived:int;
		private var _hasReededHead:Boolean;
		private var _dataByte:Byte;
		/**
		 *收到数据 
		 * @param evt
		 * 
		 */		
		private function onMessageReveived(message:*=null):void
		{
			if (message is String) {
				trace("is String");
			} else if (message is ArrayBuffer) {
				//trace("is ArrayBuffer");
				
				
				_dataByte = new Byte(message);
				_dataByte.endian = Socket.BIG_ENDIAN;
				
				
				
				this.dispatchEvent(new LSEvent(LSEvent.RECEIVE,_dataByte));
			}
		}
		
		private function onSocketOpen(evt:Event = null):void
		{
			trace('Socket connect success！',_port);
			
			_isConneced = true;
			_currRetryTimes = 0;
			_isReConnecting = false;
			
			//开始
			
			this.dispatchEvent(new LSEvent(LSEvent.CONNECTION));
		}
		
		private function onSocketClose(evt:Event = null):void
		{
			_isClose = true;
			
			trace("SocketConnect onSocketClose",_socket.connected,_isConnectingError,_isClose)
			
			if(_isConneced){
				trace("关闭连接");
				clear();
				this.dispatchEvent(new LSEvent(LSEvent.CLOSE));
				this.dispatchEvent(new LSEvent(LSEvent.DISCONNECT));
			}else{
				if(_isConnectingError && _isClose){
					sentEvent();
				}
			}
			
			_isConneced = false;
		}
		
		private function clear():void{
			_currRetryTimes = 0;
		}
	}
}