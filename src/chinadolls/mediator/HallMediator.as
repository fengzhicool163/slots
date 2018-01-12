package chinadolls.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.events.LightEvent;
	import com.lightUI.logging.Log;
	import com.lightUI.manager.timer.Timer;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.model.data.HallData;
	import chinadolls.model.vo.SlotConfigData;
	import chinadolls.model.vo.HallRoomVO;
	import slots.service.HallSocketService;
	import chinadolls.service.WebService;
	
	import laya.events.Event;
	import laya.utils.Handler;
	import msg.ENCSType;
	import view.hall.Hall;
	
	public class HallMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "hallMediator";
		
		private var hallData:HallData;
		

		
		private var cowboyConfigData:SlotConfigData;
		
		public function HallMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function getInjector():Array{
			return null;
		}
		
		public function get hall():Hall
		{
			return viewComponent as Hall;
		}
		
		override public function setViewComponent(viewComponent:Object):void{
			super.viewComponent = viewComponent;
			
			hall.list.on(LightEvent.ITEM_CLICK,this,onListItemClick);
			hallData.addEventListener(LightEvent.CHANGE, this,onRoomListChange);
			hall.btnEdite.on(Event.CLICK,this, onClick);
			hall.btnRule.on(Event.CLICK, this, onClick);
			hall.btnSet.on(Event.CLICK, this, onClick);
			hall.btnExit.on(Event.CLICK, this, onReturnClick);
			showOrHideBtnGroup(false);
			
			addNotifiction(GameNotification.HallSocketClose);
			addNotifiction(GameNotification.ServerColseEvent);
		}
		
		private function onRoomListChange():void{
			hall.showRoomList(hallData.roomList);
		}
		
		
		/**
		 * 点击设置上的按钮 
		 */		
		private function onClick(e:Event):void
		{
			trace("onClick:"+e.target);
			switch(e.target)
			{
				case hall.btnSet:
					sentNotification("cowboy.SHOW_MUSIC_SET_PANEL");
					break;
				case hall.btnRule:
					sentNotification("cowboy.SHOW_RULE_PANEL");
					break;
				case hall.btnEdite:
					showOrHideBtnGroup(!hall.imgSetBackground.visible);
					break;
			}
		}
		
		/**
		 * 隐藏或显示设置按钮状态 
		 */		
		private function showOrHideBtnGroup(flag:Boolean):void
		{
			hall.imgSetBackground.visible = flag;
			hall.btnRule.visible = flag;
			hall.btnSet.visible = flag;
		}
		
		private function onListItemClick(data:*):void{
			Log.debug("onListItemClick",data.id);
			hallData.roomId = data.id;
			sentNotification(ENCSType.CS_TYPE_GET_PLAYER_ENTER_STATE_REQ.toString());
		}
		
		private function onReturnClick():void
		{
			dispose();
			//返回平台
			var ws:WebService = getModel(WebService.NAME) as WebService;
			ws.goback(Handler.create(this, onGoback));
		}
		
		override public function handler(notification:INotification):void
		{
			//			trace("HallMediator handler",notification.getName());
			var type:String = notification.getName();
			switch(type)
			{
				case GameNotification.HallSocketClose:
					dispose();
					break;
				case GameNotification.ServerColseEvent:
					onReturnClick();
					break;
				default:
					break;
			}
		}
		
		
		private function onGoback():void{
			
		}
		
		public function dispose():void{
			clearTimer();
			
//			hallData.offAll();
			hall.despose();
		}
		
		public function enterRoom():void
		{
			var vo:HallRoomVO = hallData.getHallRoomInfoById(hallData.roomId);
			if(!vo) return;
			sentNotification(GameNotification.ENTER_ROOM, vo);			
		}
		
		private var timer:Timer;
		private var num:int;
		public var currentId:int;
		private var timerIndex:int;
		public function sendHeartBeat():void
		{
			//启动心跳计时并发送
			startHeartCount();
			sendMsg();
		}
		
		private function sendMsg():void{
			if(num > cowboyConfigData.reconnectNum){
				//提示断线了 正在为您重连，请稍等……
				//				alert("正在为您重连，请稍等……");
				clearTimer();
			
				return;
			}
			num++;
			sentNotification(GameNotification.HALL_HEART_BEAT);
		}
		
		private function startHeartCount():void{
			if(!timer) {
				timer = new Timer();
				timerIndex = timer.setInterval(this,sendMsg, cowboyConfigData.heartSpeed,null);
			}
		}
		
		public function receiveHeartBeat():void
		{
			num = 0;
		}
		
		private function clearTimer():void{
			if(!timer) return; 
			timer.clearInterval(timerIndex);
			timer = null;
			num = 0;
		}
	}
}