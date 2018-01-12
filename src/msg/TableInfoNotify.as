package msg
{
	import conf.BetInfo;
	import conf.Prop;
	import com.IProtobuf.Message;
	import conf.Money;

	public class TableInfoNotify extends Message
	{

		public var table_state:int = 1;
		public var cur_location_id:uint = 2;
		public var item_id:Array = 3;
		public var item_hit_sts:Array = null;
		public var cur_round:RoundInfo = null;
		public var bet_time:uint = 8;
		public var confirm_time:uint = 9;
		public var cashing_time:uint = 10;
		public var player_balance:conf.Money = null;
		public var player_saved_bet:Array = null;
		public var winneritems:Array = 13;
		public function writeTo(value:*):void{
		}
	}
}
