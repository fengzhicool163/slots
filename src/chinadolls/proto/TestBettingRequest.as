package chinadolls.proto
{
	import com.IProtobuf.Message;

	public class TestBettingRequest extends Message
	{

		public var betLines:int = 1;
		public var betQuota:int = 2;
		public var finalResult:Array = 3;
		public function writeTo(value:*):void{
		}
	}
}
