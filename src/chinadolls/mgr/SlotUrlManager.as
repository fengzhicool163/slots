package chinadolls.mgr
{
	import com.lightUI.manager.loader.URLManager;
	
	public class SlotUrlManager extends URLManager
	{
		private static  var _singleton:Boolean=true;
		private static  var _instance:SlotUrlManager;
		public function SlotUrlManager() {
			if (_singleton) {
				throw new Error("只能用getInstance()来获取实例");
			}
		}
		public static function getInstance():SlotUrlManager{
			if (!_instance) {
				_singleton=false;
				_instance=new SlotUrlManager();
				_singleton=true;
			}
			return _instance;
		}
		
		override public function get configURL():String{
			return "config/GameURL.json";
		}
	}
}