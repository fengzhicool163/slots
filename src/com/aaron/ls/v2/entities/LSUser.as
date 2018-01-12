package com.aaron.ls.v2.entities
{
	import com.IProtobuf.Long;
	import com.aaron.ls.v2.entities.data.ILSObject;
	import com.aaron.ls.v2.entities.data.LSObject;
	import com.aaron.ls.v2.entities.managers.IUserManager;
	import com.aaron.ls.v2.entities.variables.IUserVariable;
	import com.aaron.ls.v2.entities.variables.Variables;
	import com.aaron.ls.v2.exceptions.LSError;
	import com.aaron.ls.v2.proto.User;
	
	import laya.utils.Byte;

	public class LSUser extends LSObject implements IUser
	{
		protected var _id:int = -1;				//id
		protected var _privilegeId:int = 0;		//权限id
		protected var _name:String;				//名字
		protected var _isItMe:Boolean;
		protected var _variables:Object;			//扩展变量
		protected var _properties:Object;			//
		protected var _isModerator:Boolean;
		protected var _playerIdByRoomId:Object;
		protected var _userManager:IUserManager;
//		private var _aoiEntryPoint:Vec3D;
		
		public function LSUser(id:int, name:String, isItMe:Boolean=false){
			super();
			this._id = id;
			this._name = name;
			this._isItMe = isItMe;
			this._variables = {};
			this._properties = {};
			this._isModerator = false;
			this._playerIdByRoomId = {};
		}
		
		public static function formProto(user:User,room:IRoom=null):IUser{
			var newUser:IUser = new LSUser(user.id,user.name);
			if(user.variables)newUser.variables = Variables.creatVariables(user.variables);
				//LSObject.fromProto(user.variables);
			return newUser;
		}
		
		public function getVariableValue(key:String):*{
			return getVariable(key).getValue();
		}
		public function getVariableBoolValue(key:String):Boolean{
			return getVariable(key).getBoolValue();
		}
		public function getVariableBytesValue(key:String):Byte{
			return getVariable(key).getBytesValue();
		}
		public function getVariableIntValue(key:String):int{
			return getVariable(key).getIntValue();
		}
		public function getVariableLoneValue(key:String):Long{
			return getVariable(key).getLoneValue();
		}
		public function getVariableDoubleValue(key:String):Number{
			return getVariable(key).getDoubleValue();
		}
		public function getVariableStringValue(key:String):String{
			return getVariable(key).getStringValue();
		}
		public function getVariableLSObjectValue(key:String):ILSObject{
			return getVariable(key).getLSObjectValue();
		}
		
		public function get id():int{
			return (this._id);
		}
		public function get name():String{
			return (this._name);
		}
		public function get playerId():int{
			return (this.getPlayerId(this.userManager.lightClinet.lastJoinedRoom));
		}
		public function isJoinedInRoom(room:IRoom):Boolean{
			return (room.containsUser(this));
		}
		public function get privilegeId():int{
			return (this._privilegeId);
		}
		public function set privilegeId(value:int):void{
			this._privilegeId = value;
		}
		public function isGuest():Boolean{
			return ((this._privilegeId == UserPrivileges.GUEST));
		}
		public function isStandardUser():Boolean{
			return ((this._privilegeId == UserPrivileges.STANDARD));
		}
		public function isModerator():Boolean{
			return ((this._privilegeId == UserPrivileges.MODERATOR));
		}
		public function isAdmin():Boolean{
			return ((this._privilegeId == UserPrivileges.ADMINISTRATOR));
		}
		public function get isPlayer():Boolean{
			return ((this.playerId > 0));
		}
		public function get isSpectator():Boolean{
			return (!(this.isPlayer));
		}
		public function getPlayerId(room:IRoom):int{
			var pId:int;
			if (this._playerIdByRoomId[room.id] != null){
				pId = this._playerIdByRoomId[room.id];
			};
			return (pId);
		}
		public function setPlayerId(id:int, room:IRoom):void{
			this._playerIdByRoomId[room.id] = id;
		}
		public function removePlayerId(room:IRoom):void{
			this._playerIdByRoomId[room.id];
		}
		public function isPlayerInRoom(room:IRoom):Boolean{
			return ((this._playerIdByRoomId[room.id] > 0));
		}
		public function isSpectatorInRoom(room:IRoom):Boolean{
			return ((this._playerIdByRoomId[room.id] < 0));
		}
		public function get isItMe():Boolean{
			return (this._isItMe);
		}
		public function get userManager():IUserManager{
			return (this._userManager);
		}
		public function set userManager(manager:IUserManager):void{
			if (this._userManager != null){
				throw (new LSError(("Cannot re-assign the User Manager. Already set. User: " + this)));
			};
			this._userManager = manager;
		}
		public function getVariables():Array{
			var uv:IUserVariable;
			var variables:Array = [];
			for each (uv in this._variables) {
				variables.push(uv);
			};
			return (variables);
		}
		public function getVariable(name:String):IUserVariable{
			return (this._variables[name]);
		}
		public function setVariable(userVariable:IUserVariable):void{
			if (userVariable != null){
				if (userVariable.isNull()){
					this._variables[userVariable.name];
				} else {
					this._variables[userVariable.name] = userVariable;
				};
			};
		}
		public function setVariables(userVariables:Array):void{
			var userVar:IUserVariable;
			for each (userVar in userVariables) {
				this.setVariable(userVar);
			};
		}
		public function containsVariable(name:String):Boolean{
			return (!((this._variables[name] == null)));
		}
		private function removeUserVariable(varName:String):void{
			this._variables[varName];
		}
		public function get properties():Object{
			return (this._properties);
		}
		public function set properties(value:Object):void{
			this._properties = value;
		}
//		public function get aoiEntryPoint():Vec3D{
//			return (this._aoiEntryPoint);
//		}
//		public function set aoiEntryPoint(loc:Vec3D):void{
//			this._aoiEntryPoint = loc;
//		}
		public function toString():String{
			//return ((((((("[User: " + this._name) + ", Id: ") + this._id) + ", isMe: ") + this._isItMe) + "]"));
			return "[id:"+_id+",name:"+_name+",isMe:"+_isItMe+",vars:"+JSON.stringify(_variables)+"]";
		}

		public function get variables():Object
		{
			return _variables;
		}

		public function set variables(value:Object):void
		{
			_variables = value;
		}

	}
}