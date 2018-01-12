package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class LoginResponse extends Message
	{

		public var userID:int = 1;
		public var userName:String = "2";
		public var zoneName:String = "3";
		public var reconnectionSeconds:int = 4;
		public var roomList:Array = null;
		public var params:PObject = null;
		public function writeTo(value:*):void{
		}
	}
}
