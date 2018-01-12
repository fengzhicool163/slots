package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class Room extends Message
	{

		public var id:int = 1;
		public var name:String = "2";
		public var groupID:String = "3";
		public var isHidden:Boolean = 4;
		public var isGame:Boolean = 5;
		public var isPasswordProtected:Boolean = 6;
		public var userCount:int = 7;
		public var maxUsers:int = 8;
		public var variables:PVariables = null;
		public var spectatorCount:int = 10;
		public var maxSpectators:int = 11;
		public function writeTo(value:*):void{
		}
	}
}
