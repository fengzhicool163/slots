package msg
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;

	public class PlayerBetReq extends Message
	{

		public var item_id:uint = 1;
		public var amount:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
