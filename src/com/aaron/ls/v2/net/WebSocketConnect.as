package com.aaron.ls.v2.net
{
	import com.aaron.ls.v2.bitswarm.EClientDisconnectionReason;
	import com.aaron.ls.v2.events.LSEvent;
	import com.aaron.ls.v2.proto.ClientDisconnectionReason;
	import com.iflash.events.EventDispatcher;
	import com.iflash.utils.ByteArray;
	import com.lightUI.core.Light;
	
	import laya.events.Event;
	import laya.net.Socket;
	import laya.utils.Browser;
	import laya.utils.Byte;

	public class WebSocketConnect extends EventDispatcher
	{
		private var _socket:Socket;
		private var _receiveBytes:ByteArray;
		private var _msgBytes:ByteArray;
		private var _sendBytes:ByteArray;
		
		public var name:String;
		
		private var _isConnectingError:Boolean = false;
		private var _isClose:Boolean = false;
		private var _isConneced:Boolean = false;//////////////////////是否是连接状态
		
		public function WebSocketConnect()
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
			//trace("连接失败");
			_isConnectingError = false;
			_isClose = false;
			this.dispatchEvent(new WebSocketEvent(WebSocketEvent.CONNECT_FAIL,{ss:ClientDisconnectionReason.CLOSE}));
		}
		
		/**
		 *连接服务器 
		 * @param host
		 * @param port
		 * 
		 */		
		public function connect(host:String,port:int):void
		{
			_isConnectingError = false;
			_isClose = false;
			
			trace("[SocketConnect] ","connect",host,port);
			_socket.connect(host,port);
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
		
		public function get connected():Boolean{
			return _socket.connected;
		}
		
//		public function set connected(value:Boolean){
//			connected
//		}
		
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
			//trace("onMessageReveived",message)
			if (message is String) {
				trace("is String");
			} else if (message is ArrayBuffer) {
				_dataByte = new Byte(message);
				_dataByte.endian = Socket.BIG_ENDIAN;
				this.dispatchEvent(new WebSocketEvent(WebSocketEvent.SOCKET_DATA,_dataByte));
			}
		}
		
		private function onSocketOpen(evt:Event = null):void
		{
			trace("Socket connect success！");
			_isConneced = true;
			this.dispatchEvent(new WebSocketEvent(WebSocketEvent.CONNECT));
		}
		
		private function onSocketClose(evt:Event = null):void
		{
			_isClose = true;
			
			if(_isConneced){
				trace("关闭连接");
				clear();
				this.dispatchEvent(new WebSocketEvent(WebSocketEvent.CLOSE));
			}else{
				if(_isConnectingError && _isClose){
					sentEvent();
				}
			}
			
			_isConneced = false;
		}
		
		private function clear():void{
			//_currRetryTimes = 0;
		}
	}
}