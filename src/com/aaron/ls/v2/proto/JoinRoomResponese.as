package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class JoinRoomResponese extends Message
	{

		public var userList:Array = null;
		public var joinedRoom:Room = null;
		public function writeTo(value:*):void{
		}
	}
}
