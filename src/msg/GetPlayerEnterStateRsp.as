package msg
{
	import com.IProtobuf.Message;

	public class GetPlayerEnterStateRsp extends Message
	{

		public var result:int = 1;
		public var table_id:uint = 2;
		public function writeTo(value:*):void{
		}
	}
}
