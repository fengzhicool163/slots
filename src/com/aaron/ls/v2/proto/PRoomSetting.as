package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class PRoomSetting extends Message
	{

		public var name:String = "1";
		public var password:String = "2";
		public var groupID:String = "3";
		public var isGame:Boolean = 4;
		public var maxUsers:int = 5;
		public var maxSpectators:int = 6;
		public var maxVars:int = 7;
		public var variables:PVariables = null;
		public var permissions:PRoomPermissions = null;
		public var events:PRoomEvents = null;
		public var extension:PRoomExtension = null;
		public function writeTo(value:*):void{
		}
	}
}
