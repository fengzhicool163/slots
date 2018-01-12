package msg
{
	import com.IProtobuf.Message;

	public class EnterTableReq extends Message
	{

		public var table_id:uint = 1;
		public function writeTo(value:*):void{
		}
	}
}
