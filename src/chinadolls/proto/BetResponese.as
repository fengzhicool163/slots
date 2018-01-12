package chinadolls.proto
{
	import com.IProtobuf.Message;

	public class BetResponese extends Message
	{

		public var gameResult:GameResult = null;
		public var isBonus:Boolean = 2;
		public var isFreeTime:Boolean = 3;
		public var freeGameResult:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
