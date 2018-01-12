package com.aaron.ls.v2.entities.managers
{
	import com.aaron.ls.v2.LightClinet;
	import com.aaron.ls.v2.entities.IRoom;
	import com.aaron.ls.v2.entities.IUser;

	public interface IRoomManager
	{
		function get ownerZone():String;
		function addRoom(room:IRoom, addGroupIfMissing:Boolean=true):void;
		function addGroup(groupId:String):void;
		function replaceRoom(room:IRoom, addToGroupIfMissing:Boolean=true):IRoom;
		function removeGroup(groupId:String):void;
		function containsGroup(groupId:String):Boolean;
		function containsRoom(idOrName):Boolean;
		function containsRoomInGroup(idOrName, groupId:String):Boolean;
		function changeRoomName(room:IRoom, newName:String):void;
		function changeRoomPasswordState(room:IRoom, isPassProtected:Boolean):void;
		function changeRoomCapacity(room:IRoom, maxUsers:int, maxSpect:int):void;
		function getRoomById(id:int):IRoom;
		function getRoomByName(name:String):IRoom;
		function getRoomList():Array;
		function getRoomCount():int;
		function getRoomGroups():Array;
		function getRoomListFromGroup(groupId:String):Array;
		function getJoinedRooms():Array;
		function getUserRooms(user:IUser):Array;
		function removeRoom(room:IRoom):void;
		function removeRoomById(id:int):void;
		function removeRoomByName(name:String):void;
		function removeUser(user:IUser):void;
		function get lightClinet():LightClinet;
	}
}