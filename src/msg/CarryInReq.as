package msg
{
	import com.IProtobuf.Message;
	import conf.Money;

	public class CarryInReq extends Message
	{

		public var money:conf.Money = null;
		public function writeTo(value:*):void{
		}
	}
}
