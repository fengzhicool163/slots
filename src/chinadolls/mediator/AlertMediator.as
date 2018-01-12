package chinadolls.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.model.param.CarryInParam;
	
	import laya.events.Event;
	
	import view.alert.AlertPanel;
	
	
	public class AlertMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "alertMediator";
		
		public function AlertMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		private function showPanel():void{
//			Light.layer.top.addChild(viewComponent);
		}
		
		private function hidePanel():void{
//			Light.layer.top.removeChild(viewComponent);
		}
		
		override public function getInjector():Array{
			return [];
		}
		
		private function getAlertPanel():AlertPanel{
			return viewComponent as AlertPanel;
		}
		
		override public function setViewComponent(viewComponent:Object):void{
			super.viewComponent = viewComponent;
			
			getAlertPanel().visible = false;
			Light.layer.top.addChild(getAlertPanel());
			
			//getAlertPanel().closeBtn.on(Event.CLICK, this, onClose);
			getAlertPanel().ok_btn.on(Event.CLICK, this, onClose);
			addNotifiction(GameNotification.SHOW_ALERT_PANEL);
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == GameNotification.SHOW_ALERT_PANEL){
				Log.debug("SHOW_ALERT_PANEL Handler");
				alertPanelShow(notification.getBody() as CarryInParam);
			}
		}
		
		private function alertPanelShow(param:CarryInParam):void{
			getAlertPanel().show(true);
		}
		
		private function onClose(e:Event):void
		{
			getAlertPanel().close();
		}
		
	}
}