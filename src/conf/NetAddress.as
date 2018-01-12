package conf
{
	import com.IProtobuf.Message;

	public class NetAddress extends Message
	{

		public var ip:String = "1";
		public var port:uint = 2;
		public var platform:int = 3;
		public function writeTo(value:*):void{
		}
	}
}
