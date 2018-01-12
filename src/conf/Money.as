package conf
{
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class Money extends Message
	{

		public var coin:Long = null;
		public var cash:Long = null;
		public var nm:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
