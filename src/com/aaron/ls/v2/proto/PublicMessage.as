package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class PublicMessage extends Message
	{

		public var roomID:int = 1;
		public var message:String = "2";
		public function writeTo(value:*):void{
		}
	}
}
