package com.aaron.ls.v2.entities.managers
{
	import com.aaron.ls.v2.LightClinet;
	import com.aaron.ls.v2.ds.HashMap;
	import com.aaron.ls.v2.entities.IUser;
	

	public class SFSUserManager implements IUserManager {
		
		private var _usersByName:HashMap;
		private var _usersById:HashMap;
		protected var _lightClinet:LightClinet;
		
		public function SFSUserManager(ls:LightClinet){
			super();
			this._lightClinet = ls;
			this._usersByName = new HashMap();
			this._usersById = new HashMap();
		}
		public function containsUserName(userName:String):Boolean{
			return (this._usersByName.containsKey(userName));
		}
		public function containsUserId(userId:int):Boolean{
			return (this._usersById.containsKey(userId));
		}
		public function containsUser(user:IUser):Boolean{
			return (this._usersByName.contains(user));
		}
		public function getUserByName(userName:String):IUser{
			return this._usersByName.find(userName) as IUser;
		}
		public function getUserById(userId:int):IUser{
			return ((this._usersById.find(userId) as IUser));
		}
		public function addUser(user:IUser):void{
			if (this._usersById.containsKey(user.id)){
				this._lightClinet.logger.warn(("Unexpected: duplicate user in UserManager: " + user));
			};
			this._addUser(user);
		}
		protected function _addUser(user:IUser):void{
			this._usersByName.insert(user.name, user);
			this._usersById.insert(user.id, user);
		}
		public function removeUser(user:IUser):void{
			this._usersByName.remove(user.name);
			this._usersById.remove(user.id);
		}
		public function removeUserById(id:int):void{
			var user:IUser = (this._usersById.find(id) as IUser);
			if (user != null){
				this.removeUser(user);
			};
		}
		public function get userCount():int{
			return (this._usersById.size());
		}
		public function get lightClinet():LightClinet{
			return this._lightClinet;
		}
		public function getUserList():Array{
			
			return _usersById.toArray();
		}
		public function clearAll():void{
			this._usersByName = new HashMap();
			this._usersById = new HashMap();
		}
		
	}
}