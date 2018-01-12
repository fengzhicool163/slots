package msg
{
	import conf.BetInfo;
	import com.IProtobuf.Message;
	import conf.Money;

	public class PlayerSavedBetRsp extends Message
	{

		public var result:int = 1;
		public var player_bets:Array = null;
		public var balance:conf.Money = null;
		public function writeTo(value:*):void{
		}
	}
}
