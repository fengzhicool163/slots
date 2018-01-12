package conf
{
	import com.IProtobuf.Message;

	public class ChanceCash extends Message
	{

		public var chance_id:uint = 1;
		public var bet_power:Scope = null;
		public var bet_chance:Array = 3;
		public function writeTo(value:*):void{
		}
	}
}
