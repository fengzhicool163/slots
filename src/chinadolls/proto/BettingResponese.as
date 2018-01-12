package chinadolls.proto
{
	import com.IProtobuf.Message;

	public class BettingResponese extends Message
	{

		public var gameResult:GameResult = null;
		public var freeGameResult:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
