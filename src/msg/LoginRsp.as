package msg
{
	import com.IProtobuf.Message;
	import conf.Currency;

	public class LoginRsp extends Message
	{

		public var result:int = 1;
		public var source:uint = 2;
		public var currency:conf.Currency = null;
		public var uname:String = "4";
		public var head_icon:String = "5";
		public function writeTo(value:*):void{
		}
	}
}
