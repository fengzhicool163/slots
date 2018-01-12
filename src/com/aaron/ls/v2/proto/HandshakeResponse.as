package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class HandshakeResponse extends Message
	{

		public var sessionToken:String = "1";
		public var maxMessageSize:int = 2;
		public var maxSessionIdleTime:int = 3;
		public function writeTo(value:*):void{
		}
	}
}
