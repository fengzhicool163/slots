package chinadolls.model.vo
{
	import conf.EPokerType;
	
	import chinadolls.model.data.RoomData;

	public class StatisticsVO
	{
		public var cowWinNum:int;
		public var cowBoyWinNum:int;
		public var drawNum:int;
		public var tonghua_shunzi_num:int;
		public var hulu_num:int;
		public var duiA_num:int;
		public var jingang_huangjia_tonghua_num:int;
		
		static private var _instance:StatisticsVO;
		public function StatisticsVO()
		{
		}
		
		static public function getInstance():StatisticsVO{
			if(!_instance)
				_instance = new StatisticsVO();
			return _instance;
		}
		
		public function analysisData(roomData:RoomData):void{
		
			cowBoyWinNum = roomData.hitHistoryAry[0] != null?roomData.hitHistoryAry[0].num:0;
			drawNum = roomData.hitHistoryAry[1] != null?roomData.hitHistoryAry[1].num:0;
			cowWinNum = roomData.hitHistoryAry[2] != null ? roomData.hitHistoryAry[2].num:0;
			tonghua_shunzi_num = roomData.hitHistoryAry[6] != null ? roomData.hitHistoryAry[6].num:0;
			duiA_num = roomData.hitHistoryAry[7] != null ? roomData.hitHistoryAry[7].num : 0;
			
			hulu_num = roomData.hitHistoryAry[12] != null ? roomData.hitHistoryAry[12].num : 0;
			jingang_huangjia_tonghua_num = (roomData.hitHistoryAry[9] != null ? roomData.hitHistoryAry[9].num:0)+ roomData.hitHistoryAry[8] != null ? roomData.hitHistoryAry[8].num : 0;
		}
		
		public function judgeData(roomData:RoomData):void{
			switch(roomData.isBullWin){
				case 0:
					cowBoyWinNum++;
					break;
				case 1:
					drawNum++;
					break;
				case 2:
					cowWinNum++
					break;
			}
			
			if(roomData.tonghuashun == 1){
				tonghua_shunzi_num++;
			}
			
			if(roomData.duiA == 1) duiA_num++;
			
			countNum(roomData.winnerType);
		}
		
		private function countNum(type:int):void{
		
			switch(type)
			{
				case EPokerType.qingyiseshunzi:
				case EPokerType.zhadan4:
					jingang_huangjia_tonghua_num++;
					break;
				default:
					break;
			}
		}
	}
}