package msg
{
	import Scope;
	import com.IProtobuf.Message;

	public class ChanceCoin extends Message
	{

		public var chance_id:uint = 1;
		public var bet_power:Scope = null;
		public var bet_chance:Array = 3;
		public function writeTo(value:*):void{
		}
	}
}
