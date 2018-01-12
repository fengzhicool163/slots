package msg
{
	import com.IProtobuf.Message;

	public class GetLangListRsp extends Message
	{

		public var result:int = 1;
		public var cs_table:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
