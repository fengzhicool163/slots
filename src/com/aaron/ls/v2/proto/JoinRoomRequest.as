package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class JoinRoomRequest extends Message
	{

		public var roomID:int = 1;
		public var roomName:String = "2";
		public var roomPass:String = "3";
		public var roomIdToLeave:int = 4;
		public var asSpect:Boolean = 5;
		public function writeTo(value:*):void{
		}
	}
}
