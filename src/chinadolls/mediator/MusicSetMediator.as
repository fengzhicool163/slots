package chinadolls.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	import com.lightUI.manager.PopupManager;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.events.GameEvent;
	import chinadolls.model.MySoundManager;
	import slots.service.SharedObjectService;
	
	import laya.events.Event;
	
	import view.alert.MusicSetPanel;
	
	/**
	 * 设置声音面板 
	 */	
	public class MusicSetMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "musicSetMediator";
		public static const SHOW_MUSIC_SET_PANEL:String = "cowboy.SHOW_MUSIC_SET_PANEL";
		public static const HIDE_MUSIC_SET_PANEL:String = "cowboy.HIDE_MUSIC_SET_PANEL";
		

		
		public function MusicSetMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function getInjector():Array
		{
			return [];
		}
		
		public function get view():MusicSetPanel
		{
			return viewComponent as MusicSetPanel;
		}
		
		override public function setViewComponent(viewComponent:Object):void
		{
			super.viewComponent = viewComponent;
			
			Light.layer.top.addChild(view);
			view.visible = false;
			PopupManager.centerPopUp(view);
			
			Log.debug("MusicSetMediator setViewComponent visible:"+view.visible);
			view.closeBtn.on(Event.CLICK, this, onClose);
			addNotifiction(SHOW_MUSIC_SET_PANEL);
			addNotifiction(HIDE_MUSIC_SET_PANEL);
			addNotifiction(GameNotification.SCENCE_CHANGE);
			view.on(GameEvent.CHANGE_SOUND_EVENT, this, changeSound);
//			view.versionTxt.text = Light.loader.URLM.config.version; 
		}
		
		override public function handler(notification:INotification):void
		{
			switch(notification.getName())
			{
				case SHOW_MUSIC_SET_PANEL:
					onShow();
					break;
				case HIDE_MUSIC_SET_PANEL:
					onClose();
					break;
				case GameNotification.SCENCE_CHANGE:
					var curScene:String = notification.getBody() as String;
					Log.debug("MusicSetMediator 切换到游戏场景:"+curScene);
//					if( curScene == GameNotification.Scene_Game || curScene == GameNotification.Scene_Hall )
//						onClose();
					break;
			}
		}
		
		private function onShow():void{
			Log.debug("MusicSetMediator onShow()");
			
			view.setMusicVoice(MySoundManager.getInstance().musicOnBol, MySoundManager.getInstance().voiceOnBol);
			view.show();
		}
		
		private function onClose(e:Event=null):void
		{
			Log.debug("MusicSetMediator onClose()");
			view.close();
		}
		
		private function changeSound(data:Object):void
		{
			var soundObj:Object = data;
			
			if(soundObj["musicOnBol"] != MySoundManager.getInstance().musicOnBol){
				MySoundManager.getInstance().musicOnBol = soundObj["musicOnBol"];
			}
			if(soundObj["voiceOnBol"] != MySoundManager.getInstance().voiceOnBol){
				MySoundManager.getInstance().voiceOnBol = soundObj["voiceOnBol"];
			}
			
			
		}
		
	}
}