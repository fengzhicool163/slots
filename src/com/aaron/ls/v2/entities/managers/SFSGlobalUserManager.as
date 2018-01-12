package com.aaron.ls.v2.entities.managers
{
	import com.aaron.ls.v2.LightClinet;
	import com.aaron.ls.v2.entities.IUser;

	public class SFSGlobalUserManager extends SFSUserManager
	{
		private var _roomRefCount:Array;
		
		public function SFSGlobalUserManager(ls:LightClinet){
			super(ls);
			this._roomRefCount = [];
		}
		override public function addUser(user:IUser):void{
			if (this._roomRefCount[user] == null){
				super._addUser(user);
				this._roomRefCount[user] = 1;
			} else {
				super._addUser(user);
				var _local2:Array = this._roomRefCount;
				var _local3:IUser = user;
				var _local4:int = (_local2[_local3] + 1);
				_local2[_local3] = _local4;
			};
		}
		override public function removeUser(user:IUser):void{
			this.removeUserReference(user, false);
		}
		public function removeUserReference(user:IUser, disconnected:Boolean=false):void{
			if (this._roomRefCount != null){
				if (this._roomRefCount[user] < 1){
					_lightClinet.logger.warn(("GlobalUserManager RefCount is already at zero. User: " + user));
					return;
				};
				var _local3 = this._roomRefCount;
				var _local4 = user;
				var _local5 = (_local3[_local4] - 1);
				_local3[_local4] = _local5;
				if ((((this._roomRefCount[user] == 0)) || (disconnected))){
					super.removeUser(user);
					this._roomRefCount[user];
				};
			} else {
				_lightClinet.logger.warn(("Can't remove User from GlobalUserManager. RefCount missing. User: " + user));
			};
		}
		private function dumpRefCount():void{
		}
	}
}