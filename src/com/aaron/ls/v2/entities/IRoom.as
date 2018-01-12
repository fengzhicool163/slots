package com.aaron.ls.v2.entities
{
	import com.IProtobuf.Long;
	import com.aaron.ls.v2.entities.data.ILSObject;
	import com.aaron.ls.v2.entities.managers.IRoomManager;
	import com.aaron.ls.v2.entities.variables.IRoomVariable;
	
	import laya.utils.Byte;

	public interface IRoom extends ILSObject
	{
		function get id():int;
		function get name():String;
		function set name(value:String):void;
		function get groupId():String;
		function get isJoined():Boolean;
		function get isGame():Boolean;
		function get isHidden():Boolean;
		function get isPasswordProtected():Boolean;
		function set isPasswordProtected(value:Boolean):void;
		function get isManaged():Boolean;
		function get userCount():int;
		function get maxUsers():int;
		function get spectatorCount():int;
		function get maxSpectators():int;
		function get capacity():int;
		function set isJoined(value:Boolean):void;
		function set isGame(value:Boolean):void;
		function set isHidden(value:Boolean):void;
		function set isManaged(value:Boolean):void;
		function set userCount(value:int):void;
		function set maxUsers(value:int):void;
		function set spectatorCount(value:int):void;
		function set maxSpectators(value:int):void;
		function addUser(user:IUser):void;
		function removeUser(user:IUser):void;
		function containsUser(user:IUser):Boolean;
		function getUserByName(name:String):IUser;
		function getUserById(id:int):IUser;
		function get userList():Array;
		function get playerList():Array;
		function get spectatorList():Array;
		function getVariable(name:String):IRoomVariable;
		function getVariables():Array;
		function setVariable(roomVariable:IRoomVariable):void;
		function setVariables(roomVariables:Array):void;
		function containsVariable(name:String):Boolean;
		function get properties():Object;
		function set properties(value:Object):void;
		function get roomManager():IRoomManager;
		function set roomManager(manager:IRoomManager):void;
		function setPasswordProtected(isProtected:Boolean):void;
		function merge(anotherRoom:IRoom):void;
		
		function getVariableValue(key:String):*;
		function getVariableBoolValue(key:String):Boolean;
		function getVariableBytesValue(key:String):Byte;
		function getVariableIntValue(key:String):int;
		function getVariableLoneValue(key:String):Long;
		function getVariableDoubleValue(key:String):Number;
		function getVariableStringValue(key:String):String;
		function getVariableLSObjectValue(key:String):ILSObject;
		
	}
}