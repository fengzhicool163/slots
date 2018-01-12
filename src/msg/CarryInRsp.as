package msg
{
	import com.IProtobuf.Message;
	import conf.Money;

	public class CarryInRsp extends Message
	{

		public var result:uint = 1;
		public var amount:conf.Money = null;
		public function writeTo(value:*):void{
		}
	}
}
