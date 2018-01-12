package com.aaron.ls.v2.logging
{
	import laya.events.Event;
	import laya.events.EventDispatcher;
	import laya.net.HttpRequest;
	import laya.utils.Browser;

    public class Logger extends EventDispatcher
    {
        private var _enableConsoleTrace:Boolean = true;
        private var _enableEventDispatching:Boolean = false;
        private var _loggingLevel:int = 200;
        private var _loggingPrefix:String;
		private var _date:Date = new Date();
		
		//是否开启持久化  存入服务端
		private var _isPersistence:Boolean = false;
		private var _address:String;////////////////////http请求地址 
		private var _path:String;//////////////////////日志目录 
		private var _hr:HttpRequest;
		private var _isDebug:Boolean = false;

        public function Logger(param1:String = "LightUI",isPersistence:Boolean = false,address:String = "",path:String = "")
        {
            this._loggingPrefix = param1;
			this._isPersistence = isPersistence;
			this._address = address;
			this._path = path;
			
			_hr = new HttpRequest();
			_hr.once(Event.PROGRESS, this, onHttpRequestProgress);
			_hr.once(Event.COMPLETE, this, onHttpRequestComplete);
			_hr.once(Event.ERROR, this, onHttpRequestError);
        }// end function

        public function get enableConsoleTrace() : Boolean
        {
            return this._enableConsoleTrace;
        }// end function

        public function set enableConsoleTrace(param1:Boolean) : void
        {
            this._enableConsoleTrace = param1;
            return;
        }// end function

        public function get enableEventDispatching() : Boolean
        {
            return this._enableEventDispatching;
        }// end function

        public function set enableEventDispatching(param1:Boolean) : void
        {
            this._enableEventDispatching = param1;
            return;
        }// end function

        public function get loggingLevel() : int
        {
            return this._loggingLevel;
        }// end function

        public function set loggingLevel(param1:int) : void
        {
            this._loggingLevel = param1;
            return;
        }// end function

        public function debug(... args:Array) : void
        {
            this.log(LogLevel.DEBUG, args.join(" "));
            return;
        }// end function

        public function info(... args:Array) : void
        {
            this.log(LogLevel.INFO, args.join(" "));
            return;
        }// end function

        public function warn(... args:Array) : void
        {
            this.log(LogLevel.WARN, args.join(" "));
            return;
        }// end function

        public function error(... args:Array) : void
        {
            this.log(LogLevel.ERROR, args.join(" "));
            return;
        }// end function

        private function log(param1:int, param2:String) : void
        {
			if(_isDebug == false) return;
            var _loc_4:Object = null;
            //var _loc_5:LoggerEvent = null;
            if (param1 < this._loggingLevel)
            {
                return;
            }
            var _loc_3:* = LogLevel.toString(param1);
            if (this._enableConsoleTrace)
            {
                trace("[" + this._loggingPrefix + "|" + _loc_3 + "|" + getNewDate() + "]", param2);
				if(_isPersistence){
					//{"path" : "123/456.log", "content" : "test"}
					var data:Object = {};
					data.path = "123/456.log";
					data.content = "[" + this._loggingPrefix + "|" + _loc_3 + "|" + getNewDate() + "]" + param2;
					_hr.send(_address,JSON.stringify(data),"post","text");
				}
            }
            if (this._enableEventDispatching)
            {
                _loc_4 = {};
                _loc_4.message = param2;
                //_loc_5 = new LoggerEvent(_loc_3.toLowerCase(), _loc_4);
               // dispatchEvent(_loc_5);
				event(_loc_3,_loc_4);
            }
            return;
        }// end function

		private function onHttpRequestError(e:*=null):void
		{
			trace(e);
		}
		
		private function onHttpRequestProgress(e:*=null):void
		{
			trace(e)
		}
		
		private function onHttpRequestComplete(e:*=null):void
		{
			trace("收到数据：" + _hr.data);
		}
		
		private function getNewDate():String{
			_date.time = Browser.now();
			return dateFormart(_date);
		}
		
		private function dateFormart(date:Date):String{
			return date.getHours()+":"+date.getMinutes()+":"+date.getMilliseconds();
		}

		public function get isPersistence():Boolean
		{
			return _isPersistence;
		}

		public function set isPersistence(value:Boolean):void
		{
			_isPersistence = value;
		}

		public function get isDebug():Boolean
		{
			return _isDebug;
		}

		public function set isDebug(value:Boolean):void
		{
			_isDebug = value;
		}


    }
}
