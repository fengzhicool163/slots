package slot
{
	import com.lightMVC.parrerns.Command;
	import com.lightUI.components.alert.Alert;
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	import com.lightUI.manager.timer.Timer;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.consts.RoomStatus;
	import chinadolls.mediator.RoomMediator;
	import chinadolls.model.MySoundManager;
	import chinadolls.model.data.RoomData;
	import chinadolls.model.data.UserInfoData;
	
	import laya.events.Event;
	import laya.utils.Handler;
	
	import view.alert.AlertPanel;
	import view.alert.AlertSimplePanel;
	import view.slot.Room;

	public class SlotAutoPanel 
	{
		private static var _instance:SlotAutoPanel = null;
		private var _slot:Room;
		private var _roomData:RoomData;
		private var _userInfoData:UserInfoData;
		private var _roomMediator:RoomMediator;
		public function SlotAutoPanel()
		{
		}
		
		public static function getInstance():SlotAutoPanel{
			if(!SlotAutoPanel._instance){
				SlotAutoPanel._instance = new SlotAutoPanel();
			}
			return SlotAutoPanel._instance;
		}
		
		
		public function init(slot:Room , roomData:RoomData , user:UserInfoData , roomMediator:RoomMediator):void{
			this._slot = slot;
			this._roomData = roomData;
			this._userInfoData = user;
			this._roomMediator = roomMediator;
			this.initUI();
		}
		
		public function initUI():void{
			this._slot.autopanel.btn_till.on(Event.CLICK,this , onClick,[0]);
			this._slot.autopanel.btn_10.on(Event.CLICK,this , onClick,[10]);
			this._slot.autopanel.btn_25.on(Event.CLICK,this , onClick,[25]);
			this._slot.autopanel.btn_50.on(Event.CLICK,this , onClick,[50]);
			this._slot.autopanel.btn_99.on(Event.CLICK,this , onClick,[99]);
			
			this._slot.dock.btn_auto.on(Event.CLICK , this , onAutoClick );
			
		}
		
		
		public function onClick(param:*):void{
			MySoundManager.getInstance().playVoiceSound("common");
			if(!param){
				this._roomData.untill = true;
			}
			else{
				this._roomData.untill = false;
				this._roomData.autoSlotNum = param;
			}
			this._slot.autopanel.visible = false;
			this._roomData.status = RoomStatus.ROOM_AUTO;
			this.onAutoSlot();
		}
		
		public function onAutoClick():void{
			if(SlotMain.running){
				return;
			}
			MySoundManager.getInstance().playVoiceSound("auto");
			this._slot.autopanel.visible = !this._slot.autopanel.visible;
		}
		
		public function onAutoSlot():void{
			if( (this._roomData.bet*this._roomData.lines)/100 > this._userInfoData.balance){
				Alert.show(Light.language.getSrting("alert_msg10"), "",AlertSimplePanel,null, Handler.create(this, gotoRecharge));
				this._roomData.status = RoomStatus.ROOM_COMMON;
				this._roomData.autoSlotNum = 0;
				return;
			}
			
			if(this._roomData.autoSlotNum <= 0 && !this._roomData.untill){
				this._roomData.status = RoomStatus.ROOM_COMMON;
				return ;
			}
			
			this._slot.dock.start.visible = false;
			this._slot.dock.btn_stop.visible = true;
			this._slot.dock.btn_stop.disabled = true;
			this._roomMediator.setBtnDisable(true);
			this._roomData.reward = 0;
			this._slot.dock.reward.text = "-"+"-";
			SlotMain.getInstance().onSlot(new Handler(this , onSlotEnd));
			this._roomMediator.sentNotification(GameNotification.START_SLOT);
		}
		
		public function gotoRecharge():void{
			
		}
		
		
		public function onSlotEnd():void{
//			this._slot.dock.start.disabled = true;
//			this._slot.dock.start.visible = true;
//			
//			this._slot.dock.btn_stop.visible = false;
			this._roomMediator.sentNotification(GameNotification.SLOT_COMPLETE_REWARD,Handler.create(this ,this.onSlotComplete));
			this._roomMediator.sentNotification(GameNotification.SLOT_UPDATE_UI , this._userInfoData);
			
			
			
		}
		
		public function onSlotComplete():void{
			if(!this._roomData.untill){
				this._roomData.autoSlotNum--;
			}
			if(SlotMain.getSlotResult()){
				
				var isBonus:Boolean = SlotMain.getSlotResult().ISBonus();
				if(isBonus){
					var arr:Array = SlotMain.getSlotResult().findSomeElement(3);
					for(var i:int = 0 ; i < arr.length; i++){
						SlotMain.getInstance().showLargeElement( arr[i] , 3 );
					}
					
					var timer:Timer = new Timer();
					timer.setTimeout(this,this.goToBonus,2600,null);
					
					
					return;
				}
				var isFreeGame:Boolean = SlotMain.getSlotResult().IsFreeGameResult();
				Log.debug("SlotAutoPanel onSlotEnd============>", isFreeGame);
				if(isFreeGame){
					var arr2:Array = SlotMain.getSlotResult().findSomeElement(2);
					for(var j:int = 0 ; j < arr2.length; j++){
						SlotMain.getInstance().showLargeElement( arr2[j] , 2 );
					}
					var timer2:Timer = new Timer();
					timer2.setTimeout(this,this.goToFreeGame,2600,null);
					
					return ;
				}
				
				
			}
			
			this._roomMediator.sentNotification(GameNotification.SLOT_RESUME_ALL_BTN);
			
			if(this._roomData.untill){
				onAutoSlot();
			}
			else if(this._roomData.autoSlotNum > 0){
				onAutoSlot();
			}
		}
		
		public function goToBonus():void{
			this._roomMediator.sentNotification(GameNotification.SLOT_SHOW_BONUS);
		}
		
		public function goToFreeGame():void{
			this._roomData.status = RoomStatus.ROOM_FREE_GAME;
			this._roomMediator.sentNotification(GameNotification.SLOT_FREE_GAME);
		}
	}
}