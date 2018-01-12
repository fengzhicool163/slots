package msg
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;

	public class PlayerBetRsp extends Message
	{

		public var result:int = 1;
		public var amount:Long = null;
		public var item_id:uint = 3;
		public function writeTo(value:*):void{
		}
	}
}
