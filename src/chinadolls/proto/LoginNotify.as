package chinadolls.proto
{
	import com.IProtobuf.Message;

	public class LoginNotify extends Message
	{

		public var uid:int = 1;
		public var userName:String = "2";
		public var nickName:String = "3";
		public var currency:String = "4";
		public function writeTo(value:*):void{
		}
	}
}
