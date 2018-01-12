package conf
{
	import com.IProtobuf.Message;

	public class BetLocation extends Message
	{

		public var location_id:uint = 1;
		public var item_id:uint = 2;
		public function writeTo(value:*):void{
		}
	}
}
