package conf
{
	import com.IProtobuf.Message;

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
