package conf
{
	import com.IProtobuf.Message;

	public class PokerInfo extends Message
	{

		public var PokerId:uint = 1;
		public var PokerIndex:uint = 2;
		public function writeTo(value:*):void{
		}
	}
}
