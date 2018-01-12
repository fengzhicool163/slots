package chinadolls.model
{
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.parrerns.Model;
	
	import chinadolls.model.data.HallData;
	import chinadolls.model.data.RoomData;
	import chinadolls.model.data.UserInfoData;
	import chinadolls.model.vo.SlotConfigData;

	public class AppModel extends Model implements IModel
	{
		public static const NAME:String = "appModel";
		
		public static const ROOM_STATE:int = 2;
		public static const HALL_STATE:int = 1;
		
		private var _state:int;
		public var roomData:RoomData;
		
		
		public static var APP_NAME:String = "TexasCowboy_";
		
		public static var HALL_RECONNECT_MASK:String = "HALL_RECONNECT_MASK";
		
		public function AppModel(modelName:String=null, data:Object=null)
		{
			super(modelName, data);
		}
		
		override public function getInjector():Array{
			return [ RoomData.NAME, UserInfoData.NAME, SlotConfigData.NAME];
		}
		
		private var _states:int = -1;////////////////EGameStateType 标记是在大厅还是在房间
		private var _oldStates:int = -1////////////////记录前一个状态
		
		public var userInfoData:UserInfoData;
		public var cowboyConfigData:SlotConfigData;
		
		public var uid:Number;
		public var token:String;
		
		public var hallLogin:Boolean;
		public var hallHeartBeat:Boolean;
		public var roomHeartBeat:Boolean;
		
		public var roomLogin:Boolean = false;
		public var isLocal:Boolean;
		
		
		public function get states():int
		{
			return _states;
		}
		
		public function set states(value:int):void
		{
			_oldStates = _states;
			_states = value;
		}
		
		public function get oldStates():int{
			return _oldStates;
		}
		
		public function clear():void{
			roomData.clear();
			userInfoData.clear();
		}
	}
}