package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class SetUserVariableRequest extends Message
	{

		public var userID:int = 1;
		public var variables:PVariables = null;
		public function writeTo(value:*):void{
		}
	}
}
