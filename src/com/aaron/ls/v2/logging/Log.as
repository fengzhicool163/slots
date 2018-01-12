package com.aaron.ls.v2.logging
{

	public class Log
	{
		static private var _logger:Logger  = new Logger("LUI",false,"http://10.63.7.63:60521/ClientLog","bull.log");
		static private var _uid:String = "";
		
		
		static public function info(...args:Array):void{
			args.splice(0,0,_uid);
			_logger.info(args);
		}
		
		static public function getLogger():Logger{
			return _logger;
		}
		
		static public function error(...args:Array):void{
			args.splice(0,0,_uid);
			_logger.error(args);
		}
		
		static public function warn(...args:Array):void{
			args.splice(0,0,_uid);
			_logger.warn(args);
		}
		
		static public function debug(...args:Array):void{
			args.splice(0,0,_uid);
			_logger.debug(args);
		}

		public static function set uid(value:String):void
		{
			_uid = value;
		}
	}
}