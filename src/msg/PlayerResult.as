package msg
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;

	public class PlayerResult extends Message
	{

		public var uname:String = "1";
		public var amount:Long = null;
		public var uid:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
