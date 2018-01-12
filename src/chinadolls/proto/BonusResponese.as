package chinadolls.proto
{
	import com.IProtobuf.Message;

	public class BonusResponese extends Message
	{

		public var winLocation:int = 1;
		public var winAmount:int = 2;
		public var currentBalance:int = 3;
		public function writeTo(value:*):void{
		}
	}
}
