package msg
{
	import com.IProtobuf.Message;

	public class ConnOperationNotify extends Message
	{

		public var op:int = 1;
		public function writeTo(value:*):void{
		}
	}
}
