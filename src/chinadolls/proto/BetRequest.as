package chinadolls.proto
{
	import com.IProtobuf.Message;

	public class BetRequest extends Message
	{

		public var betLines:int = 1;
		public var betQuota:int = 2;
		public function writeTo(value:*):void{
		}
	}
}
