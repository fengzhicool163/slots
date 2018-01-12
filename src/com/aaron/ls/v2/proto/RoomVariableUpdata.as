package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class RoomVariableUpdata extends Message
	{

		public var roomID:int = 1;
		public var variables:PVariables = null;
		public function writeTo(value:*):void{
		}
	}
}
