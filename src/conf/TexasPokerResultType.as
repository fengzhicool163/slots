package conf
{
	import com.IProtobuf.Message;

	public class TexasPokerResultType extends Message
	{

		public var pokerInfo:Array = null;
		public var anyOnePokerType:Array = 2;
		public var winerPokerType:uint = 3;
		public function writeTo(value:*):void{
		}
	}
}
