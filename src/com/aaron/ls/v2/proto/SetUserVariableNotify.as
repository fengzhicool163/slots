package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class SetUserVariableNotify extends Message
	{

		public var userId:int = 1;
		public var variables:PVariables = null;
		public function writeTo(value:*):void{
		}
	}
}
