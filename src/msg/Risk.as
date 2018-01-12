package msg
{
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class Risk extends Message
	{

		public var config_id:uint = 1;
		public var coin_pre_level:uint = 2;
		public var cash_pre_level:uint = 3;
		public var sts_len:uint = 4;
		public var round_sum_bets_notify_inteval:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
