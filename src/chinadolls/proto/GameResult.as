package chinadolls.proto
{
	import com.IProtobuf.Message;

	public class GameResult extends Message
	{

		public var winLines:Array = null;
		public var resultGrid:Array = 2;
		public var winAmount:int = 3;
		public var currentBalance:int = 4;
		public var isBonus:Boolean = 5;
		public var isFreeTime:Boolean = 6;
		public function writeTo(value:*):void{
		}
	}
}
