package msg
{
	import conf.Currency;
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class ConnHead extends Message
	{

		public var uid:Long = null;
		public var uname:String = "5";
		public var verify_sig:String = "2";
		public var client_version:Long = null;
		public var platform:int = 4;
		public var conn_id:uint = 11;
		public var conn_ids:Array = 16;
		public var conn_ip:String = "12";
		public var conn_port:uint = 13;
		public var is_new_conn:Boolean = 14;
		public var is_close_conn:Boolean = 15;
		public var is_login:Boolean = 21;
		public var source:uint = 22;
		public var currency:conf.Currency = null;
		public var head_icon:String = "24";
		public function writeTo(value:*):void{
		}
	}
}
