package com.aaron.ls.v2.entities.variables
{
	import com.IProtobuf.Long;
	import com.aaron.ls.v2.entities.data.ILSObject;
	import com.aaron.ls.v2.proto.LProto;
	import com.aaron.ls.v2.proto.PVariable;
	
	import laya.utils.Byte;

	public interface IVariable
	{
		function get name():String;
		function get type():int;
		function getValue():*;
		function getBoolValue():Boolean;
		function getBytesValue():Byte;
		function getIntValue():int;
		function getLoneValue():Long;
		function getDoubleValue():Number;
		function getStringValue():String;
		function getLSObjectValue():ILSObject;
		//function getSFSArrayValue():ISFSArray;
		function isNull():Boolean;
		function fromProto(proto:PVariable):void;
		//function toSFSArray():ISFSArray;
		function toProtobuf(proto:LProto):PVariable;
	}
}