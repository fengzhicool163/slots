package msg
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;

	public class TimeSyncRsp extends Message
	{

		public var server_time:uint = 1;
		public var server_time_milli:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
