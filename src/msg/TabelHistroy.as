package msg
{
	import conf.WinnerHistroy;
	import com.IProtobuf.Message;

	public class TabelHistroy extends Message
	{

		public var winnercounthistroy:Array = null;
		public var winnertypehistroy:Array = 2;
		public function writeTo(value:*):void{
		}
	}
}
