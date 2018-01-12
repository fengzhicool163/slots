package msg
{
	import Notice;
	import lotteryConfig;
	import Risk;
	import ChanceCoin;
	import ChanceCash;
	import com.IProtobuf.Message;
	import DirtyWord;
	import Mail;
	import BetLocation;
	import Table;
	import BetItem;
	import HitSts;

	public class Game extends Message
	{

		public var tables:Array = null;
		public var dirty_words:Array = null;
		public var notices:Array = null;
		public var mails:Array = null;
		public var bet_items:Array = null;
		public var bet_locations:Array = null;
		public var chances_coin:Array = null;
		public var chances_cash:Array = null;
		public var hit_sts:Array = null;
		public var risk:Array = null;
		public var lotterys:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
