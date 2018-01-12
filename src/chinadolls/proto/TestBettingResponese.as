package chinadolls.proto
{
	import com.IProtobuf.Message;

	public class TestBettingResponese extends Message
	{

		public var gameResult:GameResult = null;
		public var freeGameResult:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
