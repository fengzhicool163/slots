package conf
{
	import com.IProtobuf.Message;

	public class lotteryConfig extends Message
	{

		public var lottery_id:uint = 1;
		public var currency:conf.ENMoneyType = null;
		public var chance_sum:uint = 3;
		public var chance:Array = 4;
		public function writeTo(value:*):void{
		}
	}
}
