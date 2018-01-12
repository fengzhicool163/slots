package chinadolls.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.core.Light;
	
	import chinadolls.consts.GameNotification;
	
	import view.tipsLoad.TipsLoadPanel;
	
	/**
	 * 加载类 
	 */	
	public class TipsLoadMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "tipsLoadMediator";
		public static const SHOW_PANEL:String = "tipsLoadMediator.SHOW_PANEL";
		public static const HIDE_PANEL:String = "tipsLoadMediator.HIDE_PANEL";
		public function TipsLoadMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function getInjector():Array{
			return [];
		}
		override public function setViewComponent(viewComponent:Object):void
		{
			super.setViewComponent(viewComponent);
			
			addNotifiction(GameNotification.LOAD_DATA_MESSAGE);
			addNotifiction(SHOW_PANEL);
			addNotifiction(HIDE_PANEL);
		}
		
		override public function onRemove():void{
		}
		
		public function get view():TipsLoadPanel
		{
			return viewComponent as TipsLoadPanel;
		}
		
		override public function handler(noti:INotification):void
		{
			switch(noti.getName())
			{
				case GameNotification.LOAD_DATA_MESSAGE:
					view.updateProcess(noti.getBody());
					break;
				case SHOW_PANEL:
					Light.layer.top.addChild(view);
					view.playTips();
					view.showMessage();
					break;
				case HIDE_PANEL:
					view.hideme();
					break;
			}
		}
		
	}
}