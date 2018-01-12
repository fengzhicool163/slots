package chinadolls.model.data
{
	import com.IProtobuf.Long;
	import com.iflash.events.Event;
	import com.iflash.events.EventDispatcher;
	import com.lightUI.comman.bet.BetInfoVO;
	import com.lightUI.comman.bet.BetSlipParam;
	import com.lightUI.comman.bet.BetSplit;
	import com.lightUI.core.Light;
	import com.lightUI.events.LightEvent;
	import com.lightUI.logging.Log;
	

	public class RoomData extends EventDispatcher
	{
		public static const NAME:String = "roomData";
		
		
		public var id:int;//////////////////房间名字（id）
		public var name:String = "";////////////////房间用来展示的名字
		
		private var _lotteruResult:int;////////////////开奖结果
		
		private var _state:int;			//桌子状态 1.一般状态 2.需要关闭状态,禁止进入,禁止新开局
		private var _status:int;///////////////  START_BET:int = 0  正常旋转状态      END_BET:int = 1 freegame状态     LOTTERY_DRAW:int = 2  bonus状态  
		private var _leftTime:int;////////////////剩余时间
		private var _lines:int;   //当前的线数
		private var _bet:Number;     // 当前的倍率
		private var _reward:Number;    //当局的中奖数额
	
		public var cash:Boolean;
		public var coin:Boolean;
		public var nm:Boolean;
		public var betTime:uint;
		
		private var _autoSlotNum:int = 0;
		private var _untill:Boolean = false;
		private var _speed:Boolean = false;
		private var _isBigWin:Boolean = false;
		
		
		public function RoomData()
		{
		}
		
		

	
		public function get isBigWin():Boolean
		{
			return _isBigWin;
		}

		public function set isBigWin(value:Boolean):void
		{
			_isBigWin = value;
		}

		public function get speed():Boolean
		{
			return _speed;
		}

		public function set speed(value:Boolean):void
		{
			_speed = value;
		}

		public function get untill():Boolean
		{
			return _untill;
		}

		public function set untill(value:Boolean):void
		{
			_untill = value;
		}

		public function get autoSlotNum():int
		{
			return _autoSlotNum;
		}

		public function set autoSlotNum(value:int):void
		{
			_autoSlotNum = value;
		}

		public function clear():void{
	
		}
		
	
		
	
	
		
		public function get status():int
		{
			return _status;
		}
		
		public function set status(value:int):void
		{
			_status = value;
		}
		
		public function get leftTime():int
		{
			return _leftTime;
		}
		
		public function set leftTime(value:int):void
		{
			//毫秒转成秒
			_leftTime = value;
		}
		
		public function toString():String{
			return "{name:"+id+",status:"+status+",leftTime:"+leftTime+"}";
		}
		

		
		public function get lotteruResult():int
		{
			return _lotteruResult;
		}
		
		public function set lotteruResult(value:int):void
		{
			_lotteruResult = value;
		}
		
		
		public function get state():int
		{
			return _state;
		}
		
		public function set state(value:int):void
		{
			_state = value;
		}
		
		
		public function set bet(bet:Number):void{
			this._bet = bet;
		}
		
		public function get bet():Number{
			return this._bet;
		}
		
		public function set lines(line:int):void{
			this._lines = line;
		}
		
		public function get lines():int{
			return this._lines;
		}
		
		
		public function set reward(reward:Number):void{
			this._reward = reward;
		}
		
		public function get reward():Number{
			return this._reward
		}
		
		
		
	}
}