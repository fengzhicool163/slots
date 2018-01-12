package conf
{
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class Table extends Message
	{

		public var server_id:uint = 1;
		public var table_id:uint = 2;
		public var table_name:String = "3";
		public var table_type:int = 4;
		public var min_bet:Long = null;
		public var max_bet:Long = null;
		public var max_player:uint = 7;
		public var bet_time:Long = null;
		public var confirm_time:Long = null;
		public var cashing_time:Long = null;
		public var chips_type:uint = 11;
		public var rank:uint = 12;
		public var inited:Boolean = 13;
		public function writeTo(value:*):void{
		}
	}
}
