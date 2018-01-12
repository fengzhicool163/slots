package com.aaron.ls.v2
{
	import com.IProtobuf.Message;
	import com.aaron.ls.v2.api.ILSApi;
	import com.aaron.ls.v2.api.LSApi;
	import com.aaron.ls.v2.bitswarm.BitSwarmClient;
	import com.aaron.ls.v2.entities.IRoom;
	import com.aaron.ls.v2.entities.IUser;
	import com.aaron.ls.v2.entities.managers.IRoomManager;
	import com.aaron.ls.v2.entities.managers.IUserManager;
	import com.aaron.ls.v2.entities.managers.LSRoomManager;
	import com.aaron.ls.v2.entities.managers.SFSGlobalUserManager;
	import com.aaron.ls.v2.events.LSEvent;
	import com.aaron.ls.v2.logging.Log;
	import com.aaron.ls.v2.logging.Logger;
	import com.aaron.ls.v2.proto.LProto;
	import com.aaron.ls.v2.proto.MSG;
	import com.aaron.ls.v2.proto.MessageID;
	import com.aaron.ls.v2.setting.LSSetting;
	
	import laya.events.EventDispatcher;

	public class LightClinet extends EventDispatcher
	{
		private const _version:String = "0.0.011";
		private var _clientDetails:String = "laya_as";
		private var _sessionToken:String;
		
		private var _webSocket:BitSwarmClient;
		
		private var _proto:LProto;
		private var _exProto:Object;
		private var _api:ILSApi;
		
		private var _inited:Boolean = false;
		private var _isDebug:Boolean = false;
		private var _isJoining:Boolean = false;
		private var _roomManager:IRoomManager;
		
		private var _zone:String = "";
		private var _lastJoinedRoom:IRoom;
		private var _userManager:IUserManager;
		private var _mySelf:IUser;
		private var _logger:Logger;
		
		private var _lsSetting:LSSetting;
		
		
		
		public function LightClinet(proto:LProto,exProto:Object = null,debug:Boolean=false):void
		{
			_exProto = exProto;
			_proto = proto;
			this._logger = new Logger();
			this._logger.enableEventDispatching = true;
			isDebug = debug;
			initialize();
		}
		
		private function initialize():void{
			_webSocket = new BitSwarmClient(this,_proto,_exProto);
			_api = new LSApi(_proto,this);
			_lsSetting = new LSSetting();
			
			_webSocket.on(LSEvent.CONNECTION, this, onSocketConnect);
			this.reset();
		}
		public function reset():void{
			this._userManager = new SFSGlobalUserManager(this);
			this._roomManager = new LSRoomManager(this); 
			this._lastJoinedRoom = null;
		}
		
		public function connect(host:String = "",port:int = -1):void
		{
			//trace("connect",this._proto)
			if(host == "") host = _lsSetting.host;
			if(port == -1) port = _lsSetting.port;
			_webSocket.connect(host,port);
		}
		
//		public function send(msg:RqsMessage):void{
//			_webSocket.send(msg);
//		}
		
		public function sendSystemMessage(msg:MSG):void{
			_webSocket.sendSystemMessage(msg);
		}
		
		public function sendExtendMessage(cmd:int,msg:Message):void{
			_webSocket.sendExtendMessage(cmd,msg);
		}
		
		private function onSocketConnect(isReconnection:Boolean):void{
			this.sendHandshakeRequest(isReconnection);
		}

		public function setSetting(info:Object):void{
			_lsSetting.configData = info;
		}
		
		public function getRoomListFromGroup(groupIds:String):Array{
			return _roomManager.getRoomListFromGroup(groupIds);
		}
		
		private function sendHandshakeRequest(isReconnection:Boolean=false):void{
			var msg:MSG = _proto.getMSG();
			msg.msgid = MessageID.HANDSHAKE_REQUEST;
			msg.handshakeRequest = _proto.getHandshakeRequest();
			msg.handshakeRequest.apiVersion = _version;
			msg.handshakeRequest.clientDetails = _clientDetails;
			msg.handshakeRequest.sessionToken = (isReconnection) ? this._sessionToken : null;
			sendSystemMessage(msg);
		}
		
		public function get mySelf():IUser
		{
			return _mySelf;
		}

		public function set mySelf(value:IUser):void
		{
			_mySelf = value;
		}

		public function get userManager():IUserManager
		{
			return _userManager;
		}

		public function set userManager(value:IUserManager):void
		{
			_userManager = value;
		}

		public function get logger():Logger
		{
			return _logger;
		}

		public function set logger(value:Logger):void
		{
			_logger = value;
		}

		public function get lastJoinedRoom():IRoom
		{
			return _lastJoinedRoom;
		}

		public function set lastJoinedRoom(value:IRoom):void
		{
			_lastJoinedRoom = value;
		}

		public function get joinedRooms():Array{
			return this.roomManager.getJoinedRooms();
		}
		
		public function get zone():String
		{
			return _zone;
		}

		public function set zone(value:String):void
		{
			_zone = value;
		}

		public function get version():String
		{
			return _version;
		}

		public function get api():ILSApi
		{
			return _api;
		}

		public function set api(value:ILSApi):void
		{
			_api = value;
		}

		public function get isJoining():Boolean
		{
			return _isJoining;
		}

		public function set isJoining(value:Boolean):void
		{
			_isJoining = value;
		}

		public function get roomManager():IRoomManager
		{
			return _roomManager;
		}

		public function set roomManager(value:IRoomManager):void
		{
			_roomManager = value;
		}

		public function get lsSetting():LSSetting
		{
			return _lsSetting;
		}

		public function set lsSetting(value:LSSetting):void
		{
			_lsSetting = value;
		}

		public function get proto():LProto
		{
			return _proto;
		}

		public function get exProto():Object{
			return _exProto;
		}
		
		public function getReconnectionSeconds():int{
			return (this._webSocket.reconnectionSeconds);
		}
		public function setReconnectionSeconds(seconds:int):void{
			this._webSocket.reconnectionSeconds = seconds;
		}

		public function get sessionToken():String
		{
			return _sessionToken;
		}

		public function set sessionToken(value:String):void
		{
			_sessionToken = value;
		}
		
		
		public function get isConnected():Boolean{
			var value:Boolean;
			if (this._webSocket != null){
				value = this._webSocket.connected;
			};
			return (value);
		}
		
		public function getNetSpeed():int{
			return _webSocket.getNetSpeed();
		}

		public function set isDebug(value:Boolean):void
		{
			_isDebug = value;
			Log.getLogger().isDebug = value;
		}
	}
}