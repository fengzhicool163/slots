package chinadolls.mediator
{
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.logging.Log;
	import com.lightUI.manager.timer.Timer;
	
	import action.ActionManager;
	import action.PlayAnimationBox;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.consts.RoomStatus;
	import chinadolls.model.MySoundManager;
	import chinadolls.model.data.RoomData;
	import chinadolls.model.data.UserInfoData;
	import chinadolls.model.vo.SlotConfigData;
	import chinadolls.proto.BonusResponese;
	import chinadolls.service.PreLoadService;
	
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.display.Animation;
	import laya.events.Event;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	import slot.SlotAutoPanel;
	import slot.SlotMain;
	import slot.SlotTransitions;
	
	import view.slot.Bonus;
	
	public class BonusMediator extends Mediator
	{
		public static const NAME:String = "bonusMediator";
		private var _eggArr:Array = [];
		private var _timer:Timer;
		private var _time:int = 30;
		private var _spriteContainer:Array=[];
		private var _curIndex:int = -1;
		private var roomData:RoomData;
		private var userInfoData:UserInfoData;
		private var _tweenReward:Number = 0;
		private var _result:int = 0;
		private var _playNums:int = 0;
		private var _winAmount:Number = 0;
		public function BonusMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == GameNotification.SLOT_SHOW_BONUS){
				
				Log.debug("BonusMediator SLOT_SHOW_BONUS======>");
				SlotTransitions.getInstance().show(true ,2000,Handler.create(this,showUI));
				//showUI();
			}
			else if(notification.getName() == GameNotification.SLOT_BONUS_RESULT){
				Log.debug("BonusMediator SLOT_BONUS_RESULT======>");
				onBonusResult(notification.getBody() as BonusResponese);
			}
			
		}
		override public function getInjector():Array{
			return [RoomData.NAME,UserInfoData.NAME];
			
			
		}
		
		override public function setViewComponent(viewComponent:Object):void{
			super.setViewComponent(viewComponent);
			addNotifiction(GameNotification.SLOT_SHOW_BONUS);
			addNotifiction(GameNotification.SLOT_BONUS_RESULT);
			this._spriteContainer.push(getBonus().s);
			this._spriteContainer.push(getBonus().s1);
			this._spriteContainer.push(getBonus().s2);
			trace('show bonus setViewComponent =============>');
			getBonus().visible = false;
		}
		
		
		public function initUI():void{
			for(var i:int = 0 ; i < 3; i++){
				var templet:Templet = new Templet();
				templet.on(Event.COMPLETE, this, onTempletComplete,[i , templet]);
				templet.loadAni("res/ani/goldegg-light.sk");
			}
			
		}
		
		
		public function getBonus():Bonus{
			return this.viewComponent as Bonus;
			
		}
		
		public function showUI():void{
			
			getBonus().visible = true;
			this._curIndex = -1;
			this._time = 30;
			getBonus().rewardLabel.text = "0";
			initUI()
			this._timer = new Timer();
			this._timer.setInterval(this , updateTime,1000,null);
		
		}
		
		public function clearUI():void{
			this._timer.clearAllTimeout();
			getBonus().visible = false;
			this.getBonus().aniImage.visible = false;
			this._winAmount = 0;
			this._playNums = 0;
			for(var i:int = 0 ; i < this._eggArr.length; i++){
				var item:Skeleton = this._eggArr[i];
				item.removeSelf();
			}
			this._eggArr = [];
			if(SlotMain.getSlotResult()){
				
				var isFreeGame:Boolean = SlotMain.getSlotResult().IsFreeGameResult();
				if(isFreeGame){
					roomData.status = RoomStatus.ROOM_FREE_GAME;
					sentNotification(GameNotification.SLOT_FREE_GAME);
					return ;
				}
				
				
			}
			sentNotification(GameNotification.SLOT_RESUME_ALL_BTN);
			//sentNotification(GameNotification.SLOT_COMPLETE_REWARD);
		}
		
		
		
		public function onTempletComplete(lines:int,templet:Templet):void{
			var curskeleton:Skeleton = templet.buildArmature(0);
			curskeleton.play(0,true);
			curskeleton.pos(120,150);
			this._spriteContainer[lines].addChild(curskeleton);
			this._spriteContainer[lines].on(Event.CLICK ,this ,onClick,[lines]);
			
			this._eggArr.push(curskeleton);
		
		}
		
		public function updateTime():void{
			this._time--;
			if(this._time < 0){
				this._time = 0;
				this._timer.clearAllIntercal();
				sentNotification(GameNotification.SLOT_BONUS_END);
				SlotTransitions.getInstance().exit(2200,Handler.create(this,this.clearUI));
			}
			getBonus().setRetainTime("0:"+ this._time);
		}
		
		
		public function setReward(num:Number):void{
			this._tweenReward = 0;
			Tween.to(this , {_tweenReward:this._winAmount,update:new Handler(this,tweenReward)},2000,Ease.backOut);
			//getBonus().rewardLabel.text = num.toString();
		}
		
		
		public function tweenReward():void{
			this._tweenReward++;
			if(this._tweenReward > this._winAmount){
				this._tweenReward = this._winAmount;
			}
			getBonus().rewardLabel.text = (this._tweenReward/100).toFixed(2).toString();
		}
		
		public function onClick(line:int):void{
			Log.debug("BonusMediator onClick==============>");
			if(this._curIndex >=0){
				return;
			}
			if(this._time <= 0){
				return;
			}
			this._timer.clearAllIntercal();
			var param:Object = new Object();
			param.betLocation = line + 1;
			sentNotification(GameNotification.SLOT_BONUS,param);
			this._curIndex = line+1;
		
		}
		
		
		public function onLoadedExplode(line:int , templet:Templet,isWin:Boolean):void{
			this._eggArr[line].removeSelf();
			//this._eggArr.splice(line,1);
			var curskeleton:Skeleton = templet.buildArmature(1);
			if(isWin){
				curskeleton.play("win",false);
				curskeleton.on(Event.STOPPED , this, this.playCoin,[line]);
			}
			else{
				curskeleton.play("lose",false);
				curskeleton.on(Event.STOPPED , this, this.playOthers);
			}
			
			curskeleton.pos(120,150);
			
			this._spriteContainer[line].addChild(curskeleton);
			//this._eggArr.push(curskeleton);
		}
		
		
		public function onPlayEnd():void{
			Log.debug("BonusMediator onBonusResult==============>");
			this._timer.clearAllIntercal();
//			if(roomData.reward > 0){
//				setReward(roomData.reward);
//			}
			this._timer.setTimeout(this, exitBonus , 3000,null);
			
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
		}
		
		public function onBonusResult(result:BonusResponese):void{
			var templet:Templet = new Templet();
			
			
			this._result = result.winLocation;
			
			//this._curIndex = result.winLocation;
			if(this._curIndex == result.winLocation){
				Log.debug("BonusMediator onBonusResult==============>",roomData.reward);
				//this._curIndex = 1;
				//setReward(roomData.reward);
				this._winAmount = result.winAmount;
				this.getBonus().rewardNum.text = result.winAmount.toString();
				sentNotification(GameNotification.SLOT_UPDATE_UI,userInfoData);
				templet.on(Event.COMPLETE, this, onLoadedExplode,[this._curIndex-1 , templet , true]);
			}
			else{
				var money:Number = Math.random()*150 + 20;
				this.getBonus().rewardNum.text = money.toFixed(2).toString();
				templet.on(Event.COMPLETE, this, onLoadedExplode,[this._curIndex-1 , templet , false]);
			}
		
			templet.loadAni("res/ani/explode-eg.sk");
			
		}
		
		
		public function playCoin(line:int):void{
			var templet:Templet = new Templet();
			templet.on(Event.COMPLETE, this,function(){
				var curskeleton:Skeleton = templet.buildArmature(1);
				if(this._curIndex == 2){
					curskeleton.play("middle",false);
					curskeleton.pos(110,140);
				}
				else if(this._curIndex == 1){
					curskeleton.play("right",false);
					curskeleton.skewY = 180;
					curskeleton.pos(400,140);
				}
				else{
					curskeleton.play("right",false);
					curskeleton.pos(-130,140);
				}
				
				this._spriteContainer[line].addChild(curskeleton);
				curskeleton.on(Event.STOPPED,this,this.playOthers,[curskeleton]);
				
			});
			templet.loadAni("res/ani/bonuscoin.sk");
		}
		
		
		public function playOthers(curskeleton:Skeleton=null):void{
			if(this._winAmount > 0){
				setReward(this._winAmount);
			}
			if(curskeleton){
				curskeleton.removeSelf();
			}
			
			var num:int = 3;
			for(var i:int = 0 ; i < num; i++){
				if(i !=(this._curIndex-1)){
					var templet:Templet = new Templet();
					templet.on(Event.COMPLETE, this, playOthersExplode,[i , templet , i == (this._result-1)]);	
					templet.loadAni("res/ani/explode-eg.sk");
				}
			}
		}
		
		
		public function playOthersExplode(line:int , templet:Templet,isWin:Boolean):void{
			this._eggArr[line].removeSelf();
			//this._eggArr.splice(line,1);
			this._playNums++;
			var curskeleton:Skeleton = templet.buildArmature(1);
			if(isWin){
				curskeleton.play("win",false);
				this._timer.setTimeout(this,this.playBonusReward,3000,line);
			}
			else{
				curskeleton.play("lose",false);
			}
			
			curskeleton.pos(120,150);
			if(this._playNums==2){
				curskeleton.on(Event.STOPPED , this, this.onPlayEnd);
			}
			//
			this._spriteContainer[line].addChild(curskeleton);
			//this._eggArr.push(curskeleton);
		}
		
		public function exitBonus():void{
			
			SlotTransitions.getInstance().exit(2200,Handler.create(this,this.clearUI));
		}
		
		
		public function playBonusReward(index:int):void{
			this.getBonus().aniImage.visible = true;
			
			var ani:String = 'ani' + (index+1);
			this.getBonus()[ani].play(0,false);
		}
	}
}