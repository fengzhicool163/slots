package msg
{
	import com.IProtobuf.Message;
	import conf.Currency;

	public class ReturnHallRsp extends Message
	{

		public var result:int = 1;
		public var source:uint = 2;
		public var currency:conf.Currency = null;
		public function writeTo(value:*):void{
		}
	}
}
