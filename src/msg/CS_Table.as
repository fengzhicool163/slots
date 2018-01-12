package msg
{
	import conf.NetAddress;
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class CS_Table extends Message
	{

		public var server_addr:Array = null;
		public var table_id:uint = 2;
		public var table_name:String = "3";
		public var table_type:int = 4;
		public var table_state:int = 5;
		public var min_bet:Long = null;
		public var max_bet:Long = null;
		public var cur_player:uint = 8;
		public var max_player:uint = 9;
		public var rank:uint = 10;
		public var chips_type:uint = 11;
		public function writeTo(value:*):void{
		}
	}
}
