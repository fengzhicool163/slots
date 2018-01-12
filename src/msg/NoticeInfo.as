package msg
{
	import conf.NetAddress;
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class NoticeInfo extends Message
	{

		public var id:uint = 1;
		public var type:int = 7;
		public var start_time:uint = 3;
		public var end_time:uint = 4;
		public var content:String = "6";
		public var server_address:conf.NetAddress = null;
		public var match_id:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
