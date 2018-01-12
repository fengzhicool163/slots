package msg
{
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class BetInfo extends Message
	{

		public var item_id:uint = 1;
		public var amount:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
