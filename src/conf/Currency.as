package conf
{
	import com.IProtobuf.Message;

	public class Currency extends Message
	{

		public var cash:Boolean = 1;
		public var coin:Boolean = 2;
		public var nm:Boolean = 3;
		public function writeTo(value:*):void{
		}
	}
}
