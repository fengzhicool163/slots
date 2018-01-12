package com.aaron.ls.v2.proto
{
	import com.IProtobuf.Long;
	import com.IProtobuf.ByteBuffer;
	import com.IProtobuf.Message;

	public class PObjectItem extends Message
	{

		public var key:String = "1";
		public var type:int = 2;
		public var boolValue:Boolean = 3;
		public var bytesValue:ByteBuffer = null;
		public var intValue:int = 5;
		public var longValue:Long = null;
		public var floatValue:Number = 7;
		public var doubleVlue:Number = 8;
		public var stringVlue:String = "9";
		public var boolValues:Array = 10;
		public var bytesValues:Array = null;
		public var intValues:Array = 12;
		public var longValues:Array = null;
		public var floatValues:Array = 14;
		public var doubleVlues:Array = 15;
		public var stringVlues:Array = "16";
		public var arrayValue:Array = null;
		public var objectValue:PObject = null;
		public function writeTo(value:*):void{
		}
	}
}
