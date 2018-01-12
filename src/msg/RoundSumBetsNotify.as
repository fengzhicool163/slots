package msg
{
	import com.IProtobuf.Message;
	import conf.BetInfo;

	public class RoundSumBetsNotify extends Message
	{

		public var sum_bets:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
