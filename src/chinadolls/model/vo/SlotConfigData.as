package chinadolls.model.vo
{
	public class SlotConfigData
	{
		public static const NAME:String = "cowboyConfigData";
		
		
		//sfs
		public var ip:String;
		public var port:int;
		public var zone:String;
		public var debug:Boolean;
		public var heartSpeed:int;
		public var reconnectNum:int;
		
		private var _configData:Object;
		
		public function get configData():Object
		{
			return _configData;
		}
		
		public function set configData(value:Object):void
		{
			_configData = value;
			ip = _configData.ip;
			port = _configData.port;
			zone = _configData.zone;
			heartSpeed = _configData.heartSpeed;
			reconnectNum = _configData.reconnectNum;
			debug = _configData.debug;
		}
	}
}