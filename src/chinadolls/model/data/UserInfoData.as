package chinadolls.model.data
{
	import com.iflash.events.EventDispatcher;
	import com.lightUI.logging.Log;
	
	import chinadolls.events.GameEvent;
	
	public class UserInfoData extends EventDispatcher
	{
		private var _uid:Number;
		private var _name:String;//////玩家名字
		private var _balance:Number=0;//////玩家余额
		private var _bonus:int;////////玩家盈利
		private var _headIcon:String;
		
		public static const NAME:String = "userInfoData";
		
		//-----------------event-----------------
		
		public function UserInfoData()
		{
			super();
		}
		
		public function get uid():Number
		{
			return _uid;
		}

		public function set uid(value:Number):void
		{
			_uid = value;
		}

		public function toString():String{
			return "{name:"+_name+",balance:"+_balance+":bonus:"+_bonus+"}";
		}
		
		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
			dispatchEvent(new GameEvent(GameEvent.USERINFO_CHANGE));
		}

		public function get balance():Number
		{
			return _balance;
		}

		public function set balance(value:Number):void
		{
			Log.debug("userbalance "+value);
			
			_balance =value;
			
			dispatchEvent(new GameEvent(GameEvent.USERINFO_CHANGE));
		}

		public function get bonus():int
		{
			return _bonus;
		}

		public function set bonus(value:int):void
		{
			_bonus = value;
			dispatchEvent(new GameEvent(GameEvent.USERINFO_CHANGE));
		}
		
		public function get headIcon():String
		{
			return _headIcon;
		}
		public function set headIcon(value:String):void
		{
			_headIcon = value;
		}
		
		public function clear():void
		{
			this.uid = -1;
			this._balance = 0;
			this.name = "";
			this._bonus = 0;
			this._headIcon = "";
		}
	}
}