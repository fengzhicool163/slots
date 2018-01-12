package msg
{
	import com.IProtobuf.Message;

	public class WinnerHistroy extends Message
	{

		public var WinnerType:int = 1;
		public var Count:int = 2;
		public function writeTo(value:*):void{
		}
	}
}
