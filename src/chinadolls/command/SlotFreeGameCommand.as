package chinadolls.command
{
	import com.IProtobuf.Message;
	import com.aaron.ls.v2.bitswarm.LSMessage;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	import com.lightUI.manager.timer.Timer;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.consts.RoomStatus;
	import chinadolls.model.data.RoomData;
	import chinadolls.model.data.UserInfoData;
	import chinadolls.model.param.SlotResultParam;
	import chinadolls.proto.ExMSG;
	import chinadolls.proto.ExMessageID;
	
	import laya.utils.Handler;
	
	import slot.SlotAutoPanel;
	import slot.SlotFreeGame;
	import slot.SlotMain;
	import slot.SlotTransitions;

	public class SlotFreeGameCommand extends Command implements ICommand
	{
		private var _freeGameNum:int = 0;
		private var _freeGameResult:Array;
		private var _timer:Timer;
		private var _totalReward:Number = 0;
		
		private var _isFreeTime:Boolean=false;
		public function SlotFreeGameCommand()
		{
			super();
			this._timer = new Timer();
		}
		
		override public function handler(notification:INotification):void{
			Log.debug("SlotFreeGameCommand===============> ")
			if(notification.getName() == GameNotification.SLOT_FREE_GAME){
				SlotFreeGame.getInstance().updateReward(0);
				this._freeGameResult = SlotMain.getSlotResult().getFreeGameResult();
				Log.debug("SlotFreeGameCommand  handler===============> ",this._freeGameResult.length)
				this._freeGameNum = this._freeGameNum + 10;
				SlotFreeGame.getInstance().updateFreeNum(this._freeGameNum);
				
				var isBonus:Boolean = SlotMain.getSlotResult().ISBonus();
				if(!isBonus){
					SlotTransitions.getInstance().show(false ,1500,Handler.create(this,show));
				}
				else{
					this.show();
				}
				
				
			}
		}
		
		
		public function show():void{
			//onSlot();
			playEffect();
			this._timer.setTimeout(this,onSlot,3000,null);
		}
		
		public function playEffect():void{
			var obj:Object = new Object();
			obj.visible = false;
			sentNotification(GameNotification.SLOT_VISIBLE , obj);
			SlotFreeGame.getInstance().play();
		}
		
		public function playEnd():void{
			SlotFreeGame.getInstance().playEnd();
			var obj:Object = new Object();
			obj.visible = true;
			sentNotification(GameNotification.SLOT_VISIBLE , obj);
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			
			if(roomData.untill){
				roomData.untill = false;
				roomData.status = RoomStatus.ROOM_COMMON;
			}
			else if(roomData.autoSlotNum> 0){
				roomData.status = RoomStatus.ROOM_AUTO;
				SlotAutoPanel.getInstance().onAutoSlot();
			}
			else{
				roomData.status = RoomStatus.ROOM_COMMON;
			}
			
			
			
			var userData:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
			sentNotification(GameNotification.SLOT_UPDATE_UI , userData);
			roomData.reward = this._totalReward;
			Log.debug("SlotFreeGameCommand playEnd=============>",roomData.reward);
			sentNotification(GameNotification.SLOT_COMPLETE_REWARD);
			sentNotification(GameNotification.SLOT_RESUME_ALL_BTN);
		}
		
		public function onSlot():void{
			SlotMain.getInstance().onSlot(new Handler(this , onSlotEnd));
			var msg:Object = this._freeGameResult.shift();
			SlotFreeGame.getInstance().updateReward(0);
			Log.debug("SlotFreeGameCommand onSlot=============>",msg);
			if(msg){
				//SlotFreeGame.getInstance().updateReward(0);
				var betParam:SlotResultParam = new SlotResultParam(msg,msg.currentBalance,msg.freeGameResult,msg.isBonus);
				var user:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
				var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
				var num:int = betParam.getWinAmount();
				this._isFreeTime = betParam.IsFreeTime();
				roomData.reward = num >0 ? (num/100):0;
				this._totalReward = this._totalReward + roomData.reward;
				Log.debug("SlotFreeGameCommand onSlot _totalReward =============>",this._totalReward);
				user.balance = betParam.getBalance() / 100;
				sentNotification(GameNotification.SLOT_RESULT,betParam);
			}
		}
		
		public function onSlotEnd():void{
			Log.debug("SlotFreeGameCommand onSlotEnd=============>");
			var num = this._freeGameResult.length;
			this._freeGameNum = this._freeGameNum - 1;
			if(this._isFreeTime){
				this._freeGameNum = this._freeGameNum + 10;
				
				SlotTransitions.getInstance().show(false ,2500,Handler.create(this,show));
				updateReward(Handler.create(this , updateFreeNum));
				//updateFreeNum();
				return ;
			}
			if(num <= 0){
				updateReward(Handler.create(this , updateFreeNum));
				this._timer.setTimeout(this,exit,2500,null);
				
			}
			else{
				updateReward(Handler.create(this , updateFreeNum));
				//updateFreeNum();
				this._timer.setTimeout(this , onSlot ,2500,null);
			}
		}
		
		public function updateFreeNum():void{
			Log.debug("SlotFreeGameCommand freenum============>",this._freeGameNum);
			SlotFreeGame.getInstance().updateFreeNum(this._freeGameNum);
		}
		
		public function updateReward(handler:Handler= null):void{
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			Log.debug("SLotFreeGameCommand freeReward===============>",roomData.reward);
			SlotFreeGame.getInstance().updateReward(roomData.reward,handler);
			
		}
		
		public function exit():void{
			updateFreeNum();
			SlotTransitions.getInstance().exit(2500,Handler.create(this,this.playEnd));
		}
	}
}