package chinadolls.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.core.Light;
	import com.lightUI.manager.PopupManager;
	
	import chinadolls.model.data.RoomData;
	
	import laya.events.Event;
	
	import view.room.TrendPokerView;
	
	public class TrendPokerMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "trendPokerMediator";
		public static const SHOW_TREND_POKER_PANEL:String = "cowboy.SHOW_TREND_POKER_PANEL";
		public static const HIDE_TREND_POKER_PANEL:String = "cowboy.HIDE_TREND_POKER_PANEL";
		
		private var roomData:RoomData;
		
		public function TrendPokerMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == SHOW_TREND_POKER_PANEL){
				view.show();
				view.updateData(roomData);
			}else if(notification.getName() == HIDE_TREND_POKER_PANEL){
				view.close();
			}
		
		}
		
		override public function getInjector():Array{
			return [RoomData.NAME];
		}
		
		public function get view():TrendPokerView
		{
			return viewComponent as TrendPokerView;
		}
		
		override public function setViewComponent(viewComponent:Object):void
		{
			super.setViewComponent(viewComponent);
			
			Light.layer.top.addChild(view);
			view.visible = false;
			PopupManager.centerPopUp(view);
			
			view.closeBtn.on(Event.CLICK, this, onClose);
			addNotifiction(SHOW_TREND_POKER_PANEL);
			addNotifiction(HIDE_TREND_POKER_PANEL);
		}
		
		
		private function onClose():void
		{
			view.close();
		}
	}
}