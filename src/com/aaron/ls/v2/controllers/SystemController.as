package com.aaron.ls.v2.controllers
{
	import com.aaron.ls.v2.LightClinet;
	import com.aaron.ls.v2.bitswarm.BitSwarmClient;
	import com.aaron.ls.v2.bitswarm.LSMessage;
	import com.aaron.ls.v2.data.PrivateMessageData;
	import com.aaron.ls.v2.data.PublicMessageData;
	import com.aaron.ls.v2.entities.IRoom;
	import com.aaron.ls.v2.entities.IUser;
	import com.aaron.ls.v2.entities.LSRoom;
	import com.aaron.ls.v2.entities.LSUser;
	import com.aaron.ls.v2.entities.data.LSObject;
	import com.aaron.ls.v2.entities.managers.IRoomManager;
	import com.aaron.ls.v2.entities.variables.IRoomVariable;
	import com.aaron.ls.v2.entities.variables.IUserVariable;
	import com.aaron.ls.v2.entities.variables.RoomVarible;
	import com.aaron.ls.v2.entities.variables.UserVariable;
	import com.aaron.ls.v2.events.LSEvent;
	import com.aaron.ls.v2.proto.GenericMessageNotify;
	import com.aaron.ls.v2.proto.GenericMessageType;
	import com.aaron.ls.v2.proto.JoinRoomNotify;
	import com.aaron.ls.v2.proto.MessageID;
	import com.aaron.ls.v2.proto.PVariable;
	import com.aaron.ls.v2.proto.PublicMessage;
	import com.aaron.ls.v2.proto.Room;
	import com.aaron.ls.v2.proto.SetRoomVariableNotify;
	import com.aaron.ls.v2.proto.SetUserVariableNotify;
	import com.aaron.ls.v2.proto.User;
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.smartfoxserver.v2.entities.Room;
	import com.smartfoxserver.v2.entities.SFSUser;
	import com.smartfoxserver.v2.entities.User;
	import com.smartfoxserver.v2.entities.data.ISFSObject;
	import com.smartfoxserver.v2.requests.GenericMessageRequest;
	import com.smartfoxserver.v2.requests.GenericMessageType;
	
	public class SystemController
	{
		private var _clinet:BitSwarmClient;
		private var _ls:LightClinet;
		
		public function SystemController(clinet:BitSwarmClient, ls:LightClinet)
		{
			_ls = ls;
			_clinet = clinet;
			clinet.on(MessageID.LOGIN_RESPONSE.toString(), this, onLoginResponse);
			clinet.on(MessageID.HANDSHAKE_RESPONSE.toString(), this, onHandshakeResponse);
			clinet.on(MessageID.JOIN_ROOM_RESPONSE.toString(),this,onJoinRoomResponese);
			clinet.on(MessageID.JOIN_ROOM_NOTIFY.toString(),this,onJoinRoomNotify);
			clinet.on(MessageID.LEAVE_ROOM_RESPONSE.toString(),this,onLeaveRoomResponse);
			clinet.on(MessageID.LEAVE_ROOM_NOTIFY.toString(),this,onLeaveRoomNotify);
			clinet.on(MessageID.GET_ROOM_LIST_RESPONSE.toString(),this,onGetRoomListResponese);
			clinet.on(MessageID.LOGOUT_RESPONSE.toString(),this,onLogoutResponese);
			clinet.on(MessageID.RECONNECTION_FAILURE_NOTIFY.toString(),this,onReconnectionFailure);
			clinet.on(MessageID.GENERIC_MESSAGE_NOTIFY.toString(),this,onGenericMessageNotity);
			
			clinet.on(MessageID.SET_ROOM_VARIABLE_NOTIFY.toString(),this,onRoomVaribleUpdata);
			clinet.on(MessageID.SET_ROOM_VARIABLE_RESPONSE.toString(),this,onRoomVaribleUpdata)
			
			clinet.on(MessageID.SET_USER_VARIABLE_NOTIFY.toString(),this,onUserVaribleUpdata);
			clinet.on(MessageID.SET_USER_VARIABLE_RESPONSE.toString(),this,onUserVaribleUpdata);
			
			clinet.on(MessageID.CLIENT_DISCONNECTION_NOTIFY.toString(),this,onClinetDisconnectionNotify);
		}
		
		private function onUserVaribleUpdata(msg:LSMessage):void{
			if(msg.error > 0){
				this._ls.event(LSEvent.SET_USER_VARIABLES_ERROR);
			}else{
				
				var data:SetUserVariableNotify = msg.content.setUserVariableNotify;
				var uId:int = data.userId;
				var user:IUser = this._ls.userManager.getUserById(uId);
				var changedVarNames:Array = [];
				
				if(user != null){
					var l:int = data.variables.variables.length;
					var uvd:PVariable;
					var uv:IUserVariable;
					for(var i:int = 0; i<l; i++){
						uvd = data.variables.variables[i];
						uv = new UserVariable();
						uv.fromProto(uvd);
						user.setVariable(uv);
						changedVarNames.push(uv.name);
					}
					this._ls.event(LSEvent.USER_VARIABLES_UPDATE,[user,changedVarNames]);
				}else{
					_ls.logger.warn(("UserVariablesUpdate: unknown user id = " + uId));
				}
			}
		}
		
		private function onClinetDisconnectionNotify(msg:LSMessage){
			
			
			var reason:int = msg.content.clientDisconnectionNotify.reason;
			handleClientDisconnection(reason);
			
			//var _local4 = this.sfs;
			//_local4.kernel::handleClientDisconnection(ClientDisconnectionReason.getReason(reasonId));
		}
		
		private function handleClientDisconnection(reason:int):void{
			this._clinet.reconnectionSeconds = 0;
			this._clinet.disconnect(reason);
			this._ls.reset();
		}
		
		private function onRoomVaribleUpdata(msg:LSMessage):void{
			if(msg.error > 0){
				this,_ls.event(LSEvent.SET_ROOM_VARIABLES_ERROR);
			}else{
				var roomVar:IRoomVariable;
				var data:SetRoomVariableNotify = msg.content.setRoomVariableNotify;
				var rId:int = data.roomID;
				
				var targetRoom:IRoom = this._ls.roomManager.getRoomById(rId);
				var changedVarNames:Array = [];
				
				if(targetRoom != null){
					var l:int = data.variables.variables.length;
					var rvd:PVariable;
					var rv:IRoomVariable;
					for(var i:int = 0; i<l; i++){
						rvd = data.variables.variables[i];
						rv = new RoomVarible();
						rv.fromProto(rvd);
						targetRoom.setVariable(rv);
						changedVarNames.push(rv.name);
					}
					this._ls.event(LSEvent.ROOM_VARIABLES_UPDATE,[targetRoom,changedVarNames]);
				}else{
					_ls.logger.warn(("RoomVariablesUpdate, unknown Room id = " + rId));
				}
			}
		}
		
		private function onGenericMessageNotity(msg:LSMessage):void{
			var msgType:int = msg.content.genericMessageNotify.type;
			switch (msgType){
				case GenericMessageType.PUBLIC_MSG:
					this.handlePublicMessage(msg.content.genericMessageNotify);
					break;
				case GenericMessageType.PRIVATE_MSG:
					this.handlePrivateMessage(msg.content.genericMessageNotify);
					break;
				//预留接口 以后慢慢实现
				case GenericMessageType.BUDDY_MSG:
					//this.handleBuddyMessage(null);
					break;
				case GenericMessageType.ADMING_MSG:
					//this.handleAdminMessage(null);
					break;
				case GenericMessageType.OBJECT_MSG:
					//this.handleObjectMessage(null);
					break;
			};
		}
		
		private function handlePublicMessage(message:GenericMessageNotify):void{
			var evtParams:PublicMessageData = new PublicMessageData();
			var room:IRoom = _ls.roomManager.getRoomById(message.targetRoomId);
			if (room != null){
				evtParams.room = room;
				evtParams.sender = _ls.userManager.getUserById(message.senderId);
				evtParams.message = message.message;
			} else {
				_ls.logger.warn(("Unexpected, PublicMessage target room doesn't exist. RoomId: " + message.targetRoomId));
			};
		}
		
		private function handlePrivateMessage(message:GenericMessageNotify):void{
			var evtParams:PrivateMessageData = new PrivateMessageData();
			var senderId:int = message.senderId;
			var sender:IUser = _ls.userManager.getUserById(senderId);
			if (sender == null){
				if (message.senderData == null){
					_ls.logger.warn("Unexpected. Private message has no Sender details!");
					return;
				};
				sender = LSUser.formProto(message.senderData,null);
			};
			evtParams.sender = sender;
			evtParams.message = message.message;	
			_ls.event(LSEvent.PRIVATE_MESSAGE, evtParams);
		}
		
		
		
		private function onLogoutResponese(msg:LSMessage):void{
			this._ls.event(LSEvent.LOGOUT,[msg.error,msg.content.logoutResponse.zoneName]);
		}
		
		private function onReconnectionFailure(msg:LSMessage):void{
			_ls.setReconnectionSeconds(0);
			_clinet.stopReconnection();
		}
		
		private function onGetRoomListResponese(msg:LSMessage):void{
			populateRoomList(msg.content.getRoomListResponese.roomList);
			this._ls.event(LSEvent.GET_ROOM_LIST, msg);
		}
		
		private function onLeaveRoomResponse(msg:LSMessage):void{
			if(msg.error > 0){
				this._ls.event(LSEvent.USER_LEAVE_ROOM_ERROR);
			}else{
				var uid:int = msg.content.leaveRoomResponese.userID;
				var rid:int = msg.content.leaveRoomResponese.roomID;
				userExitRoom(uid,rid);
			}
		}
		
		private function onLeaveRoomNotify(msg:LSMessage):void{
			var uid:int = msg.content.leaveRoomNotify.userID;
			var rid:int = msg.content.leaveRoomNotify.roomID;
			userExitRoom(uid,rid);
		}
		
		private function userExitRoom(uid:int,rid:int):void{
			
			var rId:int = rid;
			var uId:int = uid;
			var room:IRoom = this._ls.roomManager.getRoomById(rid);
			var user:IUser = this._ls.userManager.getUserById(uId);
			if (((!((room == null))) && (!((user == null))))){
				room.removeUser(user);
				this._ls.userManager.removeUser(user);
				if (((user.isItMe) && (room.isJoined))){
					room.isJoined = false;
					if (this._ls.joinedRooms.length == 0){
						this._ls.lastJoinedRoom = null;
					};
					if (!(room.isManaged)){
						this._ls.roomManager.removeRoom(room);
					};
				};
				this._ls.event(LSEvent.USER_EXIT_ROOM,[user,room]);
			} else {
				trace(((("Failed to handle UserExit event. Room: " + room) + ", User: ") + user));
			};
		}
		
		private function onJoinRoomNotify(msg:LSMessage):void{
			var joinRoomNotify:JoinRoomNotify = msg.content.joinRoomNotify;
			
			var user:IUser
			var room:IRoom = this._ls.roomManager.getRoomById(joinRoomNotify.roomID);
			if(room != null){
				user = getOrCreateUser(joinRoomNotify.user,true,room);
				room.addUser(user);
				_ls.event(LSEvent.USER_ENTER_ROOM,[user,room]);
			}
		}
		
		private function onJoinRoomResponese(msg:LSMessage):void{
			var j:int = 0;
			var room:IRoom;
			var userData:User;
			var user:IUser;
			var roomManager:IRoomManager = this._ls.roomManager;
			
			_ls.isJoining = false;
			if(msg.error == 0){
				room = LSRoom.fromProto(msg.content.joinRoomResponese.joinedRoom);
				room.roomManager = _ls.roomManager;
				room = roomManager.replaceRoom(room,roomManager.containsGroup(room.groupId));
				while(j<msg.content.joinRoomResponese.userList.length){
					userData = msg.content.joinRoomResponese.userList[j];
					user = this.getOrCreateUser(userData,true,room);
					user.setPlayerId(-1,room);
					room.addUser(user);
					j++;
				}
				room.isJoined = true;
				this._ls.lastJoinedRoom = room;
				_ls.event(LSEvent.ROOM_JOIN,room);
			}else{
				_ls.event(LSEvent.ROOM_JOIN_ERROR,msg.error);
			}
		}
		
		private function onLoginResponse(msg:LSMessage):void{
			if(msg.error == 0){
				this._ls.mySelf = new LSUser(msg.content.loginResponse.userID ,msg.content.loginResponse.userName,true);
				this._ls.mySelf.userManager = this._ls.userManager;
				this._ls.userManager.addUser(this._ls.mySelf);
				this._ls.zone = msg.content.loginResponse.zoneName;
				//this._ls.mySelf.privilegeId = msg.getShort(LoginRequest.KEY_PRIVILEGE_ID);
				//this._ls.setReconnectionSeconds(msg.getShort(LoginRequest.KEY_RECONNECTION_SECONDS));
				
				var param:LSObject = new LSObject();
				if(msg.content.loginResponse.params){
					param.parseProto(msg.content.loginResponse.params);
				}
				
				this._ls.setReconnectionSeconds(msg.content.loginResponse.reconnectionSeconds);
				populateRoomList(msg.content.loginResponse.roomList);
				this._ls.event(LSEvent.LOGIN, param);
			}else{
				_ls.event(LSEvent.LOGIN_ERROR,msg.error);
			}
		}
		
		private function onHandshakeResponse(msg:LSMessage):void{
			_ls.event(LSEvent.HANDSHAKE, msg);
			if(msg.error == 0){
				_ls.sessionToken = msg.content.handshakeResponse.sessionToken;
				_clinet.maxMessageSize = msg.content.handshakeResponse.maxMessageSize;
				_clinet.maxSessionIdleTime = msg.content.handshakeResponse.maxSessionIdleTime;
				if(_clinet.isReconnecting){
					_clinet.isReconnecting = false;
					_ls.event(LSEvent.CONNECTION_RESUME);
				}else{
					_ls.event(LSEvent.CONNECTION);
				}
			}else{
				_ls.event(LSEvent.CONNECT_FAIL,msg.error);
			}
		}
		
		private function populateRoomList(roomList:Array):void{
			var roomObj:Room;
			var newRoom:IRoom;
			var roomManager:IRoomManager = this._ls.roomManager;
			var j:int;
			while (j < roomList.length) {
				roomObj = roomList[j];
				newRoom = LSRoom.fromProto(roomObj);
				roomManager.replaceRoom(newRoom);
				//trace("===>",newRoom.getVariable("c"))
				j++;
			};
		}
		
		private function getOrCreateUser(userObj:User, addToGlobalManager:Boolean=false, room:IRoom=null):IUser{
			var uId:int = userObj.id;
			var user:IUser = this._ls.userManager.getUserById(uId);
			if (user == null){
				user = LSUser.formProto(userObj, room);
				user.userManager = this._ls.userManager;
			} else {
				if (room != null){
					user.setPlayerId(-1, room);
					
				};
			};
			if (addToGlobalManager){
				this._ls.userManager.addUser(user);
			};
			return (user);
		}
		
		
	}
}