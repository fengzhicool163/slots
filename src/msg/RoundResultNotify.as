package msg
{
	import com.IProtobuf.Message;

	public class RoundResultNotify extends Message
	{

		public var result:RoundResult = null;
		public var pokers:Array = 2;
		public var qingyise:uint = 3;
		public var shunzi:uint = 4;
		public var duizi:uint = 5;
		public var qingyiseshunzi:uint = 6;
		public var duia:uint = 7;
		public var winnertype:uint = 8;
		public var winnerpokers:Array = 9;
		public var isbullwin:uint = 10;
		public var boytype:uint = 11;
		public var bulltype:uint = 12;
		public function writeTo(value:*):void{
		}
	}
}
