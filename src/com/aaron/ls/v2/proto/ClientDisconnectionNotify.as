package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class ClientDisconnectionNotify extends Message
	{

		public var reason:int = 1;
		public function writeTo(value:*):void{
		}
	}
}
