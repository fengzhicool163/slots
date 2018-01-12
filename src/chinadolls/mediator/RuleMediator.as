package chinadolls.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	import com.lightUI.manager.PopupManager;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.model.MySoundManager;
	
	import laya.events.Event;
	import laya.media.SoundManager;
	import laya.ui.Box;
	import laya.ui.Image;
	import laya.utils.Handler;
	
	import view.alert.RulePanel;
	
	
	
	
	/**
	 * 规则面板 
	 */	
	public class RuleMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ruleMediator";
		public static const SHOW_RULE_PANEL:String ="cowboy.SHOW_RULE_PANEL";//显示规则说明面板事件
		public static const HIDE_RULE_PANEL:String ="cowboy.HIDE_RULE_PANEL";//显示规则说明面板事件
		private var _pages:int = 0;
		private var _curPage:int = 0;
		private var _picArr:Array = [];
	
		public function RuleMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function getInjector():Array{
			return [];
		}
		
		private function get view():RulePanel
		{
			return viewComponent as RulePanel;
		}
		
		override public function setViewComponent(viewComponent:Object):void
		{
			super.viewComponent = viewComponent;
			
			Light.layer.top.addChild(view);
			view.visible = false;
			PopupManager.centerPopUp(view);
			
			Log.debug("RuleMediator setViewComponent visible:"+view.visible);
			view.btnClose.on(Event.CLICK, this, onClose);
			addNotifiction(SHOW_RULE_PANEL);
			addNotifiction(HIDE_RULE_PANEL);
			addNotifiction(GameNotification.SCENCE_CHANGE);
			viewComponent.btn_next.on(Event.CLICK , this,next);
			viewComponent.btn_previous.on(Event.CLICK , this , previous);
			this._picArr = [viewComponent.rule0,viewComponent.rule1,viewComponent.rule2,viewComponent.rule3];
			this._pages = this._picArr.length;
			viewComponent.rule1.visible = false;
			viewComponent.rule2.visible = false;
			viewComponent.rule3.visible = false;
			//viewComponent.rulelist.array = this._picArr;
			//this._pages = view.rulelist.length;
			//viewComponent.rulelist.itemRender = viewComponent.cell;
			//viewComponent.rulelist.renderHandler = new Handler(this , updateItem);
			//viewComponent.rulelist.scrollTo(this._curPage);
		}
		
		override public function handler(notification:INotification):void
		{
			switch(notification.getName())
			{
				case SHOW_RULE_PANEL:
					onShow();
					break;
				case HIDE_RULE_PANEL:
					onClose();
					break;
				case GameNotification.SCENCE_CHANGE:
					var curScene:String = notification.getBody() as String; //当前准备切换到的场景
					Log.debug("MusicSetMediator 切换到游戏场景:"+curScene);
//					if( curScene == GameNotification.Scene_Game || curScene == GameNotification.Scene_Hall )
//						onClose();
//					if( curScene == GameNotification.Scene_Hall )
//					{
//						SoundManager.stopAll();
//						SoundManager.stopMusic();
//					}
					break;
			}
		}
		
		private function onShow():void{
			Log.debug("RuleMediator onShow()");
			view.show();
		}
		
		private function onClose(e:Event=null):void
		{
			Log.debug("RuleMediator onClose()");
			MySoundManager.getInstance().playVoiceSound("common");
			view.close();
		}
		
		
		private function next():void{
			MySoundManager.getInstance().playVoiceSound("common");
			this._curPage++;
			if(this._curPage >= this._pages){
				this._curPage = this._pages-1;
			}
			for(var i:int = 0;i<this._picArr.length;i++){
				this._picArr[i].visible = false;
			}
			this._picArr[this._curPage].visible = true;
		}
		
		
		private function previous():void{
			MySoundManager.getInstance().playVoiceSound("common");
			this._curPage--;
			if(this._curPage<0){
				this._curPage = 0;
			}
			for(var i:int = 0;i<this._picArr.length;i++){
				this._picArr[i].visible = false;
			}
			this._picArr[this._curPage].visible = true;
		}
	
		
		
		private function updateItem(cell:* , index:int):void{
			cell.image.source = this._picArr[index];
		}
	}
	
	
}