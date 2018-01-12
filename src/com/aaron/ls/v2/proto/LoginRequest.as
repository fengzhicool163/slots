package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Message;

	public class LoginRequest extends Message
	{

		public var userName:String = "1";
		public var password:String = "2";
		public var zoneName:String = "3";
		public var params:PObject = null;
		public function writeTo(value:*):void{
		}
	}
}
