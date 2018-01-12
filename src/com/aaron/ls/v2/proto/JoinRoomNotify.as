package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class JoinRoomNotify extends Message
	{

		public var roomID:int = 1;
		public var user:User = null;
		public function writeTo(value:*):void{
		}
	}
}
