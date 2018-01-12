package chinadolls.proto
{
	import com.IProtobuf.Message;

	public class ExMSG extends Message
	{

		public var loginNotify:LoginNotify = null;
		public var bringMoneyRequest:BringMoneyRequest = null;
		public var bringMoneyResponse:BringMoneyResponse = null;
		public var betRequest:BettingRequest = null;
		public var betResponese:BettingResponese = null;
		public var testBetRequest:TestBettingRequest = null;
		public var testBetResponese:TestBettingResponese = null;
		public var bonusRequest:BonusRequest = null;
		public var bonusResponese:BonusResponese = null;
		public var bonusOverRequest:BonusOverRequest = null;
		public function writeTo(value:*):void{
		}
	}
}
