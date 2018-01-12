package msg
{
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;
	import conf.Money;

	public class RoundResult extends Message
	{

		public var item_id:uint = 1;
		public var location_id:uint = 2;
		public var balance:conf.Money = null;
		public var bonus:Long = null;
		public var ranklist:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
