package conf
{
	import com.IProtobuf.Message;

	public class Notice extends Message
	{

		public var type:int = 1;
		public var locations:Array = 3;
		public var duration:uint = 4;
		public var content:String = "6";
		public function writeTo(value:*):void{
		}
	}
}
