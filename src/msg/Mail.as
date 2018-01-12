package msg
{
	import com.IProtobuf.Message;

	public class Mail extends Message
	{

		public var index:uint = 1;
		public var type:int = 2;
		public var currency:int = 3;
		public var mail_type:uint = 4;
		public var sender:String = "5";
		public var title:String = "6";
		public var content:String = "7";
		public function writeTo(value:*):void{
		}
	}
}
