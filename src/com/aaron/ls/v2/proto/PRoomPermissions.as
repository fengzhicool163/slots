package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class PRoomPermissions extends Message
	{

		public var allowNameChanges:Boolean = 1;
		public var allowPasswordStateChange:Boolean = 2;
		public var allowPublicMessage:Boolean = 3;
		public var allowResizing:Boolean = 4;
		public function writeTo(value:*):void{
		}
	}
}
