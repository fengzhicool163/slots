package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class GenericMessageNotify extends Message
	{

		public var type:int = 1;
		public var senderId:int = 2;
		public var senderData:User = null;
		public var targetRoomId:int = 4;
		public var message:String = "5";
		public function writeTo(value:*):void{
		}
	}
}
