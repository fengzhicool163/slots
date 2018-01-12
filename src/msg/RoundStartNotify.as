package msg
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;

	public class RoundStartNotify extends Message
	{

		public var round_id:Long = null;
		public var firstpoker_id:int = 2;
		public function writeTo(value:*):void{
		}
	}
}
