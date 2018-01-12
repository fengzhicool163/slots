package chinadolls.proto
{
	import com.IProtobuf.Message;

	public class WinLines extends Message
	{

		public var lineid:int = 1;
		public var count:int = 2;
		public var icon:int = 3;
		public function writeTo(value:*):void{
		}
	}
}
