package com.aaron.ls.v2.entities.managers
{
	import com.aaron.ls.v2.LightClinet;
	import com.aaron.ls.v2.entities.IUser;

	public interface IUserManager
	{
		function containsUserName(userName:String):Boolean;
		function containsUserId(userId:int):Boolean;
		function containsUser(user:IUser):Boolean;
		function getUserByName(userName:String):IUser;
		function getUserById(userId:int):IUser;
		function addUser(user:IUser):void;
		function removeUser(user:IUser):void;
		function removeUserById(id:int):void;
		function get userCount():int;
		function getUserList():Array;
		function get lightClinet():LightClinet;
	}
}