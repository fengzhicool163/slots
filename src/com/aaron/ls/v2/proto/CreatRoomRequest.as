package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class CreatRoomRequest extends Message
	{

		public var setting:PRoomSetting = null;
		public var autoJoin:Boolean = 2;
		public var roomToLeave:int = 3;
		public function writeTo(value:*):void{
		}
	}
}
