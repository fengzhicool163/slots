package msg
{
	import com.IProtobuf.Message;

	public class BetItem extends Message
	{

		public var item_id:uint = 1;
		public var type:int = 2;
		public var name:String = "3";
		public var bet_rate:uint = 4;
		public function writeTo(value:*):void{
		}
	}
}
