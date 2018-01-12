package msg
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;

	public class LevelTestRsp extends Message
	{

		public var result:int = 1;
		public var sum_bet:Long = null;
		public var sum_win:Long = null;
		public var cur_level:int = 4;
		public function writeTo(value:*):void{
		}
	}
}
