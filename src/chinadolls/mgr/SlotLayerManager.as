package chinadolls.mgr
{
	import com.lightUI.manager.layerManager.LayerManager;
	import com.lightUI.manager.layerManager.LayerMask;

	public class SlotLayerManager extends LayerManager
	{
		private static  var _singleton:Boolean=true;
		private static  var _instance:SlotLayerManager;
		public function SlotLayerManager() {
			if (_singleton) {
				throw new Error("只能用getInstance()来获取实例");
			}
		}
		public static function getInstance():SlotLayerManager{
			if (!_instance) {
				_singleton=false;
				_instance=new SlotLayerManager();
				_singleton=true;
			}
			return _instance;
		}
		
		public var loading:LayerMask = new LayerMask();
	}
}