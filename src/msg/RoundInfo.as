package msg
{
	import conf.BetInfo;
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class RoundInfo extends Message
	{

		public var round_id:Long = null;
		public var round_state:int = 3;
		public var state_remain_time:Long = null;
		public var state_last_time:Long = null;
		public var total_bets:Array = null;
		public var result:RoundResult = null;
		public var player_bets:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
