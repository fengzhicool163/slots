package com.aaron.ls.v2.entities.managers
{
	import com.aaron.ls.v2.LightClinet;
	import com.aaron.ls.v2.ds.HashMap;
	import com.aaron.ls.v2.ds.Iterator;
	import com.aaron.ls.v2.entities.IRoom;
	import com.aaron.ls.v2.entities.IUser;
	import com.aaron.ls.v2.util.ArrayUtil;
	
	public class LSRoomManager implements IRoomManager {
		
		private var _ownerZone:String;
		private var _groups:Array;
		private var _roomsById:HashMap;
		private var _roomsByName:HashMap;
		protected var _lightClinet:LightClinet;
		
		public function LSRoomManager(ls:LightClinet):void{
			
			this._groups = new Array();
			this._roomsById = new HashMap();
			this._roomsByName = new HashMap();
		}
		public function get ownerZone():String{
			return (this._ownerZone);
		}
		public function set ownerZone(value:String):void{
			this._ownerZone = value;
		}
		public function get lightClinet():LightClinet{
			return (this._lightClinet);
		}
		public function addRoom(room:IRoom, addGroupIfMissing:Boolean=true):void{
			this._roomsById.insert(room.id, room);
			this._roomsByName.insert(room.name, room);
			if (addGroupIfMissing){
				if (!(this.containsGroup(room.groupId))){
					this.addGroup(room.groupId);
				};
			} else {
				room.isManaged = false;
			};
		}
		public function replaceRoom(room:IRoom, addToGroupIfMissing:Boolean=true):IRoom{
			var oldRoom:IRoom = this.getRoomById(room.id);
			if (oldRoom != null){
				var _local4:IRoom = oldRoom;
				_local4.merge(room);
				return (oldRoom);
			};
			this.addRoom(room, addToGroupIfMissing);
			return (room);
		}
		public function changeRoomName(room:IRoom, newName:String):void{
			var oldName:String = room.name;
			room.name = newName;
			this._roomsByName.insert(newName, room);
			this._roomsByName.remove(oldName);
		}
		public function changeRoomPasswordState(room:IRoom, isPassProtected:Boolean):void{
			room.setPasswordProtected(isPassProtected);
		}
		public function changeRoomCapacity(room:IRoom, maxUsers:int, maxSpect:int):void{
			room.maxUsers = maxUsers;
			room.maxSpectators = maxSpect;
		}
		public function getRoomGroups():Array{
			return (this._groups);
		}
		public function addGroup(groupId:String):void{
			this._groups.push(groupId);
		}
		public function removeGroup(groupId:String):void{
			var room:IRoom;
			ArrayUtil.removeElement(this._groups, groupId);
			var roomsInGroup:Array = this.getRoomListFromGroup(groupId);
			for each (room in roomsInGroup) {
				if (!(room.isJoined)){
					this.removeRoom(room);
				} else {
					room.isManaged = false;
				};
			};
		}
		public function containsGroup(groupId:String):Boolean{
			return (this._groups.indexOf(groupId) > -1);
		}
		public function containsRoom(idOrName):Boolean{
			if (typeof(idOrName) == "number"){
				return (this._roomsById.containsKey(idOrName));
			};
			return (this._roomsByName.containsKey(idOrName));
		}
		public function containsRoomInGroup(idOrName, groupId:String):Boolean{
			var room:IRoom;
			var roomList:Array = this.getRoomListFromGroup(groupId);
			var found:Boolean;
			var searchById:Boolean = (typeof(idOrName) == "number");
			for each (room in roomList) {
				if (searchById){
					if (room.id == idOrName){
						found = true;
						break;
					};
				} else {
					if (room.name == idOrName){
						found = true;
						break;
					};
				};
			};
			return (found);
		}
		public function getRoomById(id:int):IRoom{
			return ((this._roomsById.find(id) as IRoom));
		}
		public function getRoomByName(name:String):IRoom{
			return ((this._roomsByName.find(name) as IRoom));
		}
		public function getRoomList():Array{
			//trace("==> ", _roomsById.toArray().length);
			
			
			return this._roomsById.toArray();
		}
		public function getRoomCount():int{
			return this._roomsById.size();
		}
		public function getRoomListFromGroup(groupId:String):Array{
			var room:IRoom;
			var roomList:Array = new Array();
			var it:Iterator = this._roomsById.getIterator();
			while (it.hasNext()) {
				room = (it.next() as IRoom);
				if (room.groupId == groupId){
					roomList.push(room);
				};
			};
			return (roomList);
		}
		public function removeRoom(room:IRoom):void{
			this._removeRoom(room.id, room.name);
		}
		public function removeRoomById(id:int):void{
			var room:IRoom = (this._roomsById.find(id) as IRoom);
			if (room != null){
				this._removeRoom(id, room.name);
			};
		}
		public function removeRoomByName(name:String):void{
			var room:IRoom = (this._roomsByName.find(name) as IRoom);
			if (room != null){
				this._removeRoom(room.id, name);
			};
		}
		public function getJoinedRooms():Array{
			var room:IRoom;
			var rooms:Array = [];
			var it:Iterator = this._roomsById.getIterator();
			while (it.hasNext()) {
				room = (it.next() as IRoom);
				if (room.isJoined){
					rooms.push(room);
				};
			};
			return (rooms);
		}
		public function getUserRooms(user:IUser):Array{
			var room:IRoom;
			var rooms:Array = [];
			var it:Iterator = this._roomsById.getIterator();
			while (it.hasNext()) {
				room = (it.next() as IRoom);
				if (room.containsUser(user)){
					rooms.push(room);
				};
			};
			return (rooms);
		}
		public function removeUser(user:IUser):void{
			var room:IRoom;
			var it:Iterator = this._roomsById.getIterator();
			while (it.hasNext()) {
				room = (it.next() as IRoom);
				if (room.containsUser(user)){
					room.removeUser(user);
				};
			};
		}
		private function _removeRoom(id:int, name:String):void{
			this._roomsById.remove(id);
			this._roomsByName.remove(name);
		}
	}
}