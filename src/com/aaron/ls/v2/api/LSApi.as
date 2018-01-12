package com.aaron.ls.v2.api
{
	import com.aaron.ls.v2.LightClinet;
	import com.aaron.ls.v2.entities.IRoom;
	import com.aaron.ls.v2.entities.LSRoom;
	import com.aaron.ls.v2.entities.data.LSObject;
	import com.aaron.ls.v2.entities.variables.IRoomVariable;
	import com.aaron.ls.v2.entities.variables.IUserVariable;
	import com.aaron.ls.v2.exceptions.LSError;
	import com.aaron.ls.v2.proto.GenericMessageType;
	import com.aaron.ls.v2.proto.JoinRoomRequest;
	import com.aaron.ls.v2.proto.LProto;
	import com.aaron.ls.v2.proto.MSG;
	import com.aaron.ls.v2.proto.MessageID;
	import com.aaron.ls.v2.proto.PrivateMessage;
	import com.aaron.ls.v2.proto.PublicMessage;
	import com.aaron.ls.v2.setting.RoomSettings;

	public class LSApi implements ILSApi
	{
		private var _proto:LProto;
		private var _ls:LightClinet;
		
		public function LSApi(proto:LProto,ls:LightClinet)
		{
			_proto = proto;
			_ls = ls;
		}
		
		/**
		 * 创建房间 
		 * @param settings		房间配置信息
		 * @param autoJoin		是否自动加入房间
		 * @param roomToLeave	离开的房间
		 * 
		 */		
		public function createRoom(settings:RoomSettings, autoJoin:Boolean = false, roomToLeave:IRoom = null):void{
			var error:Array = [];
			if (settings.name == null || settings.name.length == 0)
			{
				error.push("Missing room name");
			}
			if (settings.maxUsers <= 0)
			{
				error.push("maxUsers must be > 0");
			}
			if (settings.extension != null)
			{
				if (settings.extension.className == null || settings.extension.className.length == 0)
				{
					error.push("Missing Extension class name");
				}
				if (settings.extension.id == null || settings.extension.id.length == 0)
				{
					error.push("Missing Extension id");
				}
			}
			
			if (error.length > 0)
			{
				throw new LSError("CreateRoom request error", error);
			}
			
			
			var msg:MSG = _proto.getMSG();
			msg.msgid = MessageID.CREATE_ROOM_REQUEST;
			msg.createRoomRequest.setting = settings.toProto(_proto);
			msg.createRoomRequest.autoJoin = autoJoin;
			if(roomToLeave != null) msg.createRoomRequest.roomToLeave = roomToLeave.id;
			_ls.sendSystemMessage(msg);
		}
		
		/**
		 * 发送房间公共消息 
		 * @param message
		 * @param toRoomId
		 * @return 
		 * 
		 */		
		public function sentPublicMessage(message:String,toRoomId:int = -1):void{
			var room:IRoom;
			if(toRoomId == -1){
				room = this._ls.lastJoinedRoom;
			}
			if(room == null) {
				throw new LSError("setPublicMessage 并未加入任何房间");
			}else{
				toRoomId = room.id;
			}
			
			var msg:PublicMessage = _proto.getPublicMessage()
			msg.message = message;
			msg.roomID = toRoomId;
			sentGenericMessage(msg,GenericMessageType.PUBLIC_MSG);
		}
		
		/**
		 * 发送私人消息 
		 * @param message
		 * @param toUserId
		 * 
		 */		
		public function sentPrivateMessage(message:String, toUserId:int):void{
			
			var msg:PrivateMessage = _proto.getPrivateMessage();
			msg.message = message;
			msg.userID = toUserId;
			sentGenericMessage(msg,GenericMessageType.PRIVATE_MSG);
		}
		
		private function sentGenericMessage(message:*,type:int):void{
			var msg:MSG = _proto.getMSG();
			msg.msgid = MessageID.GENERIC_MESSAGE_REQUEST;
			if(type == GenericMessageType.PUBLIC_MSG){
				msg.genericMessageRequest.publicMessage = message;
			}else if(type == GenericMessageType.PRIVATE_MSG){
				msg.genericMessageRequest.privateMessage = message;
			}
			
			_ls.sendSystemMessage(msg);
		}
		
		/**
		 * 获取房间列表 
		 * @param groupIds
		 * 
		 */		
		public function getRoomList(groupIds:Array = null):void{
			var msg:MSG = _proto.getMSG();
			msg.msgid = MessageID.GET_ROOM_LIST_REQUEST;
			msg.getRoomListRequest = _proto.getGetRoomListRequest();
			msg.getRoomListRequest.groupIds = groupIds;
			
			
			_ls.sendSystemMessage(msg);
		}
		
		/**
		 * 登录 
		 * @param userName		用户名
		 * @param password		登录密码
		 * @param zoneName		登录的zone名称
		 * @param params		携带的自定义参数
		 * 
		 */		
		public function login(userName:String, password:String,zoneName:String = "",params:LSObject = null):void{
			trace("==> login")
			if(zoneName == "") zoneName = _ls.lsSetting.zone;
			
			var msg:MSG = _proto.getMSG();
			msg.msgid = MessageID.LOGIN_REQUEST;
			msg.loginRequest = _proto.getLoginRequest();
			msg.loginRequest.userName = userName;
			msg.loginRequest.password = password;
			msg.loginRequest.zoneName = zoneName;
			if(params) msg.loginRequest.params = params.toProto(_proto);
			
			_ls.sendSystemMessage(msg);
		}
		
		/**
		 * 登出 
		 * @param zoneName
		 * 
		 */		
		public function logout(zoneName:String = ""):void{
			if (_ls.mySelf == null){
				throw (new LSError("LogoutRequest Error", ["You are not logged in a the moment!"]));
			};
			if(zoneName == "") zoneName = _ls.zone;
			if(_ls.zone != zoneName){
				throw (new LSError("LogoutRequest Error", ["You are not logged "+zoneName+"in the moment!"]));
			}
			var msg:MSG = _proto.getMSG();
			msg.msgid = MessageID.LOGOUT_REQUEST;
			msg.logoutRequest = _proto.getLogoutRequest();
			msg.logoutRequest.zoneName = zoneName;
			_ls.sendSystemMessage(msg);
		}
		
		/**
		 * 加入房间 
		 * @param id					//房间id（int）如果是String类型 则视为name（String）
		 * @param pass					//房间密码  默认为空 表示不需要密码的房间
		 * @param roomIdToLeave			//需要离开的房间id  默认值为-1 表示离开之前登录的房间
		 * @param asSpect
		 * 
		 */		
		public function joinRoom(id:*,pass:String = "",roomIdToLeave:int = -1,asSpect:Boolean = false):void{
			var msg:MSG = _proto.getMSG();
			msg.msgid = MessageID.JOIN_ROOM_REQUEST;
			msg.joinRoomRequest = _proto.getJoinRoomRequest();
			var joinRoomRequest:JoinRoomRequest = msg.joinRoomRequest;
			if(id is String){
				joinRoomRequest.roomName = id;
			}else if(id is int){
				joinRoomRequest.roomID = id;
			}else{
				throw new Error("joinRoom bad id");
			}
			if(roomIdToLeave != -1)joinRoomRequest.roomIdToLeave = roomIdToLeave;
			if(asSpect) joinRoomRequest.asSpect = asSpect;
			_ls.sendSystemMessage(msg);
		}
		
		/**
		 * 离开房间  
		 * @param id	 	需要离开的房间id，默认值为-1 表示离开最近加入的房间
		 * 
		 */		
		public function leaveRoom(id:int = -1):void{
			
			var joinedRooms:Array = _ls.joinedRooms;
			if(joinedRooms.length < 1){
				throw new Error("You are not joined in any rooms");
			}else{
				var msg:MSG = _proto.getMSG();
				msg.msgid = MessageID.LEAVE_ROOM_REQUEST;
				msg.leaveRoomRequest = _proto.getLeaveRoomRequest();
				
				if(id != -1){
					for each(var room:IRoom in joinedRooms){
						if(room.id == id){
							msg.leaveRoomRequest.roomID = id;
							_ls.sendSystemMessage(msg);
							return;
						}
					}
					throw new Error("You are not joined in this room "+id);
				}
				_ls.sendSystemMessage(msg);
			}
		}
		
		/**
		 * 设置房间变量 
		 * @param roomVariables
		 * @param room
		 * 
		 */		
		public function setRoomVariables(roomVariables:Array, room:IRoom=null):void{
			var errors:Array = [];
			if (room != null){
				if (!(room.containsUser(_ls.mySelf))){
					errors.push("You are not joined in the target room");
				};
			} else {
				if (_ls.lastJoinedRoom == null){
					errors.push("You are not joined in any rooms");
				};
			};
			if ((((roomVariables == null)) || ((roomVariables.length == 0)))){
				errors.push("No variables were specified");
			};
			if (errors.length > 0){
				throw (new LSError("SetRoomVariables request error", errors));
			};
			
			
			var msg:MSG = _proto.getMSG();
			msg.msgid = MessageID.SET_ROOM_VARIABLE_REQUEST;
			msg.setRoomVariableRequest = _proto.getSetRoomVariableRequest();
			msg.setRoomVariableRequest.variables = _proto.getPVariables();
			
			var rv:IRoomVariable;
			for each (rv in roomVariables) {
				msg.setRoomVariableRequest.variables.variables.push(rv.toProtobuf(_proto));
			};
			if (room == null){
				room = _ls.lastJoinedRoom;
			};
			_ls.sendSystemMessage(msg);
		}
		
		public function setUserVariables(userVariables:Array):void{
			var errors:Array = [];
			if ((((userVariables == null)) || ((userVariables.length == 0)))){
				errors.push("No variables were specified");
			};
			if (errors.length > 0){
				throw (new LSError("SetUserVariables request error", errors));
			};
			
			
			var msg:MSG = _proto.getMSG();
			msg.msgid = MessageID.SET_USER_VARIABLE_REQUEST;
			msg.setUserVariableRequest = _proto.getSetUserVariableRequest();
			msg.setUserVariableRequest.variables = _proto.getPVariables();
			
			var uVar:IUserVariable;
			for each (uVar in userVariables) {
				msg.setUserVariableRequest.variables.variables.push(uVar.toProtobuf(_proto));
			};
			
			_ls.sendSystemMessage(msg);
		}
	}
}