package msg
{
	import com.IProtobuf.Message;

	public class KickPlayerNotify extends Message
	{

		public var reason:int = 1;
		public function writeTo(value:*):void{
		}
	}
}
