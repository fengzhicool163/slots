package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class GenericMessageRequest extends Message
	{

		public var type:int = 1;
		public var publicMessage:PublicMessage = null;
		public var privateMessage:PrivateMessage = null;
		public function writeTo(value:*):void{
		}
	}
}
