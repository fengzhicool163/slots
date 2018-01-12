package msg
{
	import Money;
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class PlayerBet extends Message
	{

		public var uid:Long = null;
		public var item_id:uint = 2;
		public var bet:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
