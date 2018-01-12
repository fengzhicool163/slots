package msg
{
	import com.IProtobuf.Message;

	public class HitSts extends Message
	{

		public var hit_id:uint = 1;
		public var sts_name:String = "2";
		public var hit_times:uint = 3;
		public var item_id:Array = 4;
		public function writeTo(value:*):void{
		}
	}
}
