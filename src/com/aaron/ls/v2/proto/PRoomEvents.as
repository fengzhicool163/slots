package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class PRoomEvents extends Message
	{

		public var allowUserEnter:Boolean = 1;
		public var allowUserExit:Boolean = 2;
		public var allowUserCountChange:Boolean = 3;
		public var allowUserVariablesUpdate:Boolean = 4;
		public function writeTo(value:*):void{
		}
	}
}
