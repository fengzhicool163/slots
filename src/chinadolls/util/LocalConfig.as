package chinadolls.util
{
	public class LocalConfig
	{
		private static var _instance = null;
		private var _lines:*;
		private var _betLevel:Object;
		public function LocalConfig()
		{
		}
		
		public static function getInstance():LocalConfig{
			if(!LocalConfig._instance){
				LocalConfig._instance = new LocalConfig();
			}
			return LocalConfig._instance;
		}
		
		public function getLine():void{
			
		}
		
		public function set lines(c:Object):void{
			this._lines = c;
		}
		
		public function get lines():Object{
			return this._lines;
		}
		
		public function set betLevel(b:Object):void{
			this._betLevel = b;
		}
		
		public function get betLevel():Object{
			return this._betLevel;
		}
	}
}