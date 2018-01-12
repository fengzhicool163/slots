package com.aaron.ls.v2.entities.data
{
	import com.aaron.ls.v2.proto.LProto;
	import com.aaron.ls.v2.proto.PObject;

	public interface ILSObject
	{
		function isNull(key:String):Boolean;
		
		function containsKey(key:String):Boolean;
		
		function removeElement(key:String):void;
		
		function getKeys():Array;
		
		function size():int;
		
		function parseProto(proto:PObject):void ;
		
		function toProto(proto:LProto):PObject;
		
		function getBool( key:String):Boolean ;
		
		function getNunber( key:String):Number ;
		
		function getString( key):String;
		
		function getInt( key:String):int;
		
		function getObject(key:String):Object ;
		
		function getLSObject( key:String):Object ;
		
		function putNull(key:String):void  ;
		
		function remove(key:String):Object; 
		
		function put(key:String, param:Object):void ;
	}
}