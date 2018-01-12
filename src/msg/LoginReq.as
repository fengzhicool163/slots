package msg
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;

	public class LoginReq extends Message
	{

		public var uid:Long = null;
		public var verify_sig:String = "3";
		public var client_version:Long = null;
		public var platform:int = 5;
		public function writeTo(value:*):void{
		}
	}
}
