package com.aaron.ls.v2.setting
{
	public class LSSetting
	{
		public var host:String = "localhost";
		public var port:int = 8888;
		public var zone:String;
		public var debug:Boolean;
		
		
		private var _configData:Object;
		
		public function get configData():Object
		{
			return _configData;
		}
		
		public function set configData(value:Object):void
		{
			_configData = value;
			host = _configData.host;
			port = _configData.port;
			zone = _configData.zone;
			debug = _configData.debug;
			
			trace("set configData ",toStirng())
		}
		
		public function toStirng():String
		{
			return "{host:"+host+",port:"+port+",zone:"+zone+"}";
		}
	}
}