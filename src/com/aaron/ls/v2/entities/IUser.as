package com.aaron.ls.v2.entities
{
	import com.IProtobuf.Long;
	import com.aaron.ls.v2.entities.data.ILSObject;
	import com.aaron.ls.v2.entities.managers.IUserManager;
	import com.aaron.ls.v2.entities.variables.IUserVariable;
	
	import laya.utils.Byte;

	public interface IUser extends ILSObject
	{
		function get id():int;
		function get name():String;
		function get playerId():int;
		function get isPlayer():Boolean;
		function get isSpectator():Boolean;
		function getPlayerId(room:IRoom):int;
		function setPlayerId(id:int, room:IRoom):void;
		function removePlayerId(room:IRoom):void;
		function get privilegeId():int;
		function set privilegeId(value:int):void;
		function get userManager():IUserManager;
		function set userManager(value:IUserManager):void;
		function isGuest():Boolean;
		function isStandardUser():Boolean;
		function isModerator():Boolean;
		function isAdmin():Boolean;
		function isPlayerInRoom(room:IRoom):Boolean;
		function isSpectatorInRoom(room:IRoom):Boolean;
		function isJoinedInRoom(room:IRoom):Boolean;
		function get isItMe():Boolean;
		function getVariables():Array;
		function getVariable(name:String):IUserVariable;
		function setVariable(userVariable:IUserVariable):void;
		function setVariables(userVariables:Array):void;
		function containsVariable(name:String):Boolean;
		function get properties():Object;
		function set properties(value:Object):void;
//		function get aoiEntryPoint():Vec3D;
		function get variables():Object;
		function set variables(value:Object):void;
		
		
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