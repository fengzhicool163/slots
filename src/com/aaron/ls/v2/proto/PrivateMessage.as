package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class PrivateMessage extends Message
	{

		public var userID:int = 1;
		public var message:String = "2";
		public function writeTo(value:*):void{
		}
	}
}
