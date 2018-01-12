package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class User extends Message
	{

		public var id:int = 1;
		public var name:String = "2";
		public var playerId:int = 3;
		public var variables:PVariables = null;
		public function writeTo(value:*):void{
		}
	}
}
