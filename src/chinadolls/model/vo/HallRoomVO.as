package chinadolls.model.vo
{
	import conf.ENPlatformType;
	import conf.NetAddress;
	
	import msg.CS_Table;

	public class HallRoomVO
	{
		public static const FREE:int = 1;/////////空闲
		public static const BUSY:int = 2;/////////繁忙
		public static const FULL:int = 3;/////////爆满
		
		public var id:int;			///////////房间名字
		public var name:String;//////////////////描述性的名字
		public var curPlayer:int = 0;		///////////房间人数
		public var maxPlayer:int =0 ; ///////////最大玩家人数
		public var chipsType:int = 0;///////////////资金类型
		public var betMin:Number = 0;/////////////////最小下注
		public var betMax:Number = 0;/////////////////最大下注
		public var tableState:int = 0;
		public var rank:uint = 0;
		public var tableType:int;
		public var ip:String;
		public var port:uint;
		
		public function HallRoomVO(id:int = 0, number:int = 0):void{
			this.id = id;
			this.curPlayer = number;
		}
		
		public function parse(roominfo:CS_Table):void{
			this.id = roominfo.table_id;
			this.name = roominfo.table_name;
			this.chipsType = roominfo.chips_type;
			this.curPlayer = roominfo.cur_player;
			this.maxPlayer = roominfo.max_player;
			this.betMin = roominfo.min_bet.toNumber();
			this.betMax = roominfo.max_bet.toNumber();
			this.rank = roominfo.rank;
			
			this.tableType = roominfo.table_type;
			this.tableState = roominfo.table_state;
			
			for (var i:int = 0; i < roominfo.server_addr.length; i++) 
			{
				var netAddress:NetAddress = roominfo.server_addr[i];
				if(netAddress.platform == ENPlatformType.PLATFORM_TYPE_MOBILE)
				{
					this.ip = netAddress.ip;
					this.port = netAddress.port;
					//trace("当前的服务器 平台：",netAddress.platform," ip:",ip," port:"+port);
				}
			}
//			this.tableState = roominfo.table_state;
//			this.tabelType = roominfo.table_type;
//			this.rank = roominfo.rank;
		}
		
		//TODO:这里需要配置 
		public function get state():int{
			if(curPlayer < 50) return 1;
			else if(curPlayer >=50 && curPlayer <100) return 2;
			else return 3;
		}
	}
}