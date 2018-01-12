package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class HandshakeRequest extends Message
	{

		public var apiVersion:String = "1";
		public var clientDetails:String = "2";
		public var sessionToken:String = "3";
		public function writeTo(value:*):void{
		}
	}
}
