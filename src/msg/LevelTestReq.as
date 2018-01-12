package msg
{
	import com.IProtobuf.Message;

	public class LevelTestReq extends Message
	{

		public var currency:int = 1;
		public var round_num:uint = 2;
		public var need_reset:Boolean = 3;
		public var key:String = "4";
		public function writeTo(value:*):void{
		}
	}
}
