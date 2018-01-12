package chinadolls
{
	
	import com.lightMVC.interfaces.IFacade;
	import com.lightMVC.parrerns.Facade;
	import com.lightUI.core.Light;
	import com.lightUI.events.ScenceManagerEvent;
	import com.lightUI.logging.Log;
	
	import chinadolls.consts.GameNotification;
	
	import laya.display.Sprite;
	
	public class SlotFacade extends Facade implements IFacade
	{
		private static  var _singleton:Boolean=true;
		private static  var _instance:SlotFacade;
		public function SlotFacade()
		{
			if (_singleton) {
				throw new Error("只能用getInstance()来获取实例");
			}
		}
		
		public static function getInstance():SlotFacade{
			if (!_instance) {
				_singleton=false;
				_instance=new SlotFacade();
				_singleton=true;
				_instance.init();
			}
			return _instance;
		}
		
		public function init():void{
			Light.scence.addEventListener(ScenceManagerEvent.UI_CREATED,this, onUICreated);
		}
		
//		//TODO:需要 配置文件？
//		private var mvcmap:Object = 
//			{
//				"SmallLoading": "smallLoadingMediator",
//				"TipsLoadPanel": "tipsLoadMediator",
//				"Hall":"HallMediator",
//				"CarScene":"carScenceMediator"
//			}
		private function onUICreated(e:ScenceManagerEvent):void{
			Log.debug("有UI被创建了",e.data.name)
			var uis:Sprite = e.data as  Sprite;
			//injectUI2Meditor(uis,mvcmap[uis.name]);
			injectUI(uis);
		}
		
		//启动 PureMVC，在应用程序中调用此方法，并传递应用程序本身的引用
		public function startup( app:Main ) : void
		{ 
			sentNotification(GameNotification.STARTUP,app);
		}
		
		public function startPreLoad():void{
			sentNotification(GameNotification.PRELOAD);
		}
	}
}