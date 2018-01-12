package chinadolls.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.logging;
	import com.lightUI.components.alert.Alert;
	import com.lightUI.core.Light;
	import com.lightUI.events.ScenceManagerEvent;
	import com.lightUI.logging.Log;
	import com.lightUI.manager.timer.Timer;
	
	import action.ActionManager;
	import action.PlayAnimationBox;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.consts.RoomStatus;
	import chinadolls.events.GameEvent;
	import chinadolls.mediator.MusicSetMediator;
	import chinadolls.model.GameProtoModel;
	import chinadolls.model.MySoundManager;
	import chinadolls.model.data.MoneyType;
	import chinadolls.model.data.RoomData;
	import chinadolls.model.data.UserInfoData;
	import chinadolls.model.param.BigWinParam;
	import chinadolls.model.vo.SlotConfigData;
	import chinadolls.proto.ExMessageID;
	import chinadolls.service.PreLoadService;
	import chinadolls.service.WebService;
	import chinadolls.util.LocalConfig;
	
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.display.Animation;
	import laya.display.BitmapFont;
	import laya.display.Sprite;
	import laya.display.Text;
	import laya.events.Event;
	import laya.resource.Texture;
	import laya.ui.Image;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.TimeLine;
	import laya.utils.Tween;
	import laya.webgl.canvas.BlendMode;
	
	import slot.SlotAutoPanel;
	import slot.SlotFreeGame;
	import slot.SlotLine;
	import slot.SlotMain;
	import slot.SlotTest;
	
	import view.alert.AlertPanel;
	import view.alert.AlertSimplePanel;
	import view.slot.AnimBox;
	import view.slot.Room;
	
	public class RoomMediator extends Mediator implements IMediator
	{
		private var preLoadService:PreLoadService;
	
		private var roomData:RoomData;
		private var userInfoData:UserInfoData;
		private var cowboyConfigData:SlotConfigData;
		private var num:int;
		private var timer:Timer;
		private var _linesIndex:int =0;
		private var _betIndex:int = 0;
		private var _rewardTween:Number = 0;   // 奖励的金币数，用于实现数字增加的缓动效果
		public static const NAME:String = "roomMediator";
		public function RoomMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		override public function getInjector():Array{
			return [PreLoadService.NAME,RoomData.NAME,UserInfoData.NAME, SlotConfigData.NAME];
			
			
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == GameNotification.SLOT_UPDATE_UI){
				var body:UserInfoData = notification.getBody() as UserInfoData;
				Log.debug("RoomMediator Handler======>" , body);
				updateUI(body);
			}
			else if(notification.getName() == GameNotification.SHOW_USER_NAME){
				var body:UserInfoData = notification.getBody() as UserInfoData;
				Log.debug("RoomMediator Handler======>" , body);
				setUserName(body);
			}
			else if(notification.getName() == GameNotification.SLOT_COMPLETE_REWARD){
				
				updateReward(notification.getBody() as Handler);
			}
			else if(notification.getName() == GameNotification.SLOT_VISIBLE){
				var parma:Object = notification.getBody() as Object;
				setDockVisible(parma.visible);
				
			}
			else if(notification.getName() == GameNotification.SLOT_STOP_BTN_GRAY){
				setStopBtnGray(false);
			}
			else if(notification.getName() == GameNotification.SLOT_DISCONNECT){
				onReturn();
			}
			else if(notification.getName() == GameNotification.SLOT_RESUME_ALL_BTN){
				this.resumeAllBtn();
			}
		}
		
		public function getRoom():Room{
			return this.viewComponent as Room;
		}
		
		public function setStopBtnGray(b:Boolean):void{
			getRoom().dock.btn_stop.disabled = b;
		}
		
		override public function setViewComponent(viewComponent:Object):void{
			super.setViewComponent(viewComponent);
//			var betAmount:BitmapFont = new BitmapFont();
//			betAmount.loadFont("BitmapFont/bnt.fnt",Handler.create(this,function(f:BitmapFont):void{
//				Text.registerBitmapFont("bnt", f);
//				this.getRoom().dock.linenum.font = "bnt.fnt";
//				this.getRoom().dock.linenum.text = "10";
//			},[betAmount]));
//			var fnt:XmlDom = Light.loader.getRes("bnt.fnt");
//			var fntTxt:Texture = Light.loader.getRes("slots/bnt.png");
//			betAmount.parseFont(fnt,fntTxt);
			
			Log.debug("RoomMediator setViewComponent");
			
			
			
			
			this._linesIndex = LocalConfig.getInstance().lines.length-1;
			getRoom().on(GameEvent.START_SLOT , this , start);
			getRoom().dock.btn_lines.on(Event.CLICK , this , onLine);
			getRoom().dock.btn_bet.on(Event.CLICK , this , onBet);
			getRoom().dock.btn_add.on(Event.CLICK , this , onBringMoney);
			getRoom().system.on(Event.CLICK , this , onSetUp);
			getRoom().setup.music.on(Event.CLICK , this , onMusic);
			getRoom().setup.rule.on(Event.CLICK , this , onRule);
			getRoom().dock.btn_common.on(Event.CLICK , this , onSpeed);
			getRoom().dock.btn_fast.on(Event.CLICK , this , onSpeed);
			getRoom().btn_return.on(Event.CLICK , this , onReturn);
			addNotifiction(GameNotification.SLOT_UPDATE_UI);
			addNotifiction(GameNotification.SHOW_USER_NAME);
			addNotifiction(GameNotification.SLOT_COMPLETE_REWARD);
			addNotifiction(GameNotification.SLOT_VISIBLE);
			addNotifiction(GameNotification.SLOT_STOP_BTN_GRAY);
			addNotifiction(GameNotification.SLOT_DISCONNECT);
			addNotifiction(GameNotification.SLOT_RESUME_ALL_BTN);
			
			SlotMain.getInstance().init(getRoom(),roomData);
			SlotFreeGame.getInstance().init(viewComponent);
			SlotAutoPanel.getInstance().init(getRoom(),roomData , userInfoData ,this);
			getRoom().dock.btn_stop.on(Event.CLICK , this ,onStop);
			SlotLine.getInstance().init(getRoom());
			//if(Log.getLogger().isDebug){
				SlotTest.getInstance().init(getRoom(),this);
			//}
			
			
//			var t:* = Light.loader.getRes("slotview");
//			var bg:Image = new Image();
//			bg.skin  = 'slots/icon_1.png'; 
//			getRoom().addChild(bg);
//			bg.pos(100,100);
			//this.getRoom().dock.linenum.font = "bnt.fnt";
			//this.getRoom().dock.linenum.text = "10";
//			var img:Image = new Image();
//			var url:String = "slots/icon_" + 3 + "_big" + ".png";
//			img.source = Light.loader.getRes(url);
//			img.anchorX = 0.5;
//			img.anchorY = 0.5;
//			var gapy:int = Math.round(( img.height)/2);
//			img.y = (1+1) * (475/6) ;//+ gapy;
//			img.x = Math.round(164/2);
//			getRoom().boxsprite0.addChild(img);
			//TimeLine.to(getRoom().dock.btn_bet,{scaleX:2,scaleY:2},600).to(getRoom().dock.btn_bet,{scaleX:1,scaleY:1},600).play(0,true);
//			getRoom().action.blendMode = BlendMode.ADD;
//			getRoom().action.visible = true;
//			getRoom().action.play();
			
//
//			var effect:Animation = new Animation();
//			effect.loadAtlas("res/atlas/effects_ani01.json",Handler.create(this,onLoaded,[effect]));
//			var ui:AnimBox = new AnimBox();
//			getRoom().addChild(ui);
			//ui.play();
		
		}
		
		
		public function onTempletComplete(lines:int,templet):void{
			var curskeleton:Skeleton = templet.buildArmature(0);
			
			curskeleton.pos(120, (2*1+1) * (475/6));
			//templet.on(Event.CLICK , this ,onLoaded);
			if(curskeleton){
				curskeleton.play(0,true);
				getRoom().boxeffect2.addChild(curskeleton);
			}
			
		}
		
		
		public function onLoaded(ani:Animation):void{
			Log.debug("RoomMediator onLoaded");
			getRoom().addChild(ani);
			ani.blendMode = BlendMode.LIGHT;
			
			ani.pos(0,0);
			ani.scale(2,2);
			ani.play(0,true);
		}
		
		
		public function start():void{
			Log.debug("RoomMediator start=====>");
			getRoom().autopanel.visible = false;
			if(SlotMain.running){
				return ;
			}
		
			MySoundManager.getInstance().playVoiceSound("slot");
			var obj:Object = new Object();
			obj.line = parseInt(viewComponent.dock.linenum.text);
			obj.bet = parseInt(viewComponent.dock.betLevel.text);
			if( (roomData.bet*roomData.lines)/100 > userInfoData.balance){
				Alert.show(Light.language.getSrting("alert_msg10"), "",AlertSimplePanel,null, Handler.create(this, gotoRecharge));
				roomData.status = RoomStatus.ROOM_COMMON;
				roomData.autoSlotNum = 0;
				return;
			}
			getRoom().dock.start.visible = false;
			getRoom().dock.btn_stop.visible = true;
			getRoom().dock.btn_stop.disabled = true;
			this.setBtnDisable(true);
			roomData.reward = 0;
			viewComponent.dock.reward.text = "-"+"-";
			
			getRoom().dock.cash.text = (userInfoData.balance - (roomData.bet*roomData.lines)/100).toFixed(2);
			SlotMain.getInstance().onSlot(new Handler(this , onSlotEnd));
			sentNotification(GameNotification.START_SLOT);
			
		}
	
		
		
		
		private function gotoRecharge(data:int,flg:String):void{
			
			
		}
		
		
		
		public function onSlotEnd():void{
			
			Log.debug("RoomMediator onSlotEnd ---============>");
			updateUI(userInfoData);
			getRoom().dock.start.disabled = true;
			getRoom().dock.start.visible = true;
			
			getRoom().dock.btn_stop.visible = false;
			sentNotification(GameNotification.SLOT_COMPLETE_REWARD , Handler.create(this,this.checkRewardGame));
			
			
			
		}
		
		
		public function checkRewardGame():void{
			if(SlotMain.getSlotResult()){
				if(roomData.isBigWin){
					var bigWin:BigWinParam = new BigWinParam(roomData.reward);
					sentNotification(GameNotification.SLOT_COMPLETE_REWARD);
					sentNotification(GameNotification.SLOT_BIG_WIN , bigWin);
					return ;
				}
			
				if(SlotMain.getSlotResult().ISBonus()){
					var arr:Array = SlotMain.getSlotResult().findSomeElement(3);
					for(var i:int = 0 ; i < arr.length; i++){
						SlotMain.getInstance().showLargeElement( arr[i] , 3 );
					}
				
					var timer:Timer = new Timer();
					timer.setTimeout(this,this.goToBonus,2600,null);
					//sentNotification(GameNotification.SLOT_SHOW_BONUS);
					return;
				}
				
				if(SlotMain.getSlotResult().IsFreeGameResult()){
					var arr2:Array = SlotMain.getSlotResult().findSomeElement(2);
					for(var j:int = 0 ; j < arr2.length; j++){
						SlotMain.getInstance().showLargeElement( arr2[j] , 2 );
					}
					var timer2:Timer = new Timer();
					timer2.setTimeout(this,this.goToFreeGame,2600,null);
					return ;
				}
				
				
			}
			getRoom().dock.start.disabled = false;
			this.setBtnDisable(false);
		}
		
		
		public function resumeAllBtn():void{
			getRoom().dock.start.disabled = false;
			getRoom().dock.start.visible = true;
			getRoom().dock.btn_stop.visible = false;
			this.setBtnDisable(false);
		}
		
		
		
		public function initSprite():void{
			var imag:Sprite = new Sprite();
			viewComponent.box0.addChild(imag);
			imag.x = 0;
			imag.y = -20;
			imag.loadImage("slots/icon_1.png");
		}
		
		
		public function updateUI(udata:UserInfoData):void{
			Log.debug("RoomMediator updateUI=============>",udata.balance);
			if(udata.balance == 0){
				viewComponent.dock.cash.text = "0";
				return ;
			}
			viewComponent.dock.cash.text = udata.balance.toString();
			
		}
		
		public function setUserName(user:UserInfoData):void{
			viewComponent.dock.username.text = user.name;
			viewComponent.dock.playerIcon.loadImage(user.headIcon,0,0,55,56);
			var item:Object = LocalConfig.getInstance().lines[this._linesIndex];
			viewComponent.dock.linenum.text = item.betLines;
			roomData.lines = parseInt(item.betLines);
			var item2:Object = LocalConfig.getInstance().betLevel[0];
			roomData.bet = parseInt(item2.betQuota);
			
			viewComponent.dock.betLevel.text = parseFloat(item2.betQuota)/100;
			updateBet();
		}
		
		
		public function onLine():void{
			if(SlotMain.running){
				return;
			}
			MySoundManager.getInstance().playVoiceSound("line");
			this._linesIndex = (this._linesIndex+1)%LocalConfig.getInstance().lines.length;
			var item:Object = LocalConfig.getInstance().lines[this._linesIndex];
			viewComponent.dock.linenum.text = item.betLines;
			roomData.lines = parseInt(item.betLines);
			updateBet();
		}
		
		public function onBet():void{
			if(SlotMain.running){
				return;
			}
			MySoundManager.getInstance().playVoiceSound("bet");
			this._betIndex = (this._betIndex +1)%LocalConfig.getInstance().betLevel.length;
			var item:Object = LocalConfig.getInstance().betLevel[this._betIndex];
			viewComponent.dock.betLevel.text = parseFloat(item.betQuota)/100;
			roomData.bet = parseInt(item.betQuota);
			updateBet();
		}
		
		public function updateBet():void{
			viewComponent.dock.betLabel.text = (parseInt(viewComponent.dock.linenum.text)* parseFloat(viewComponent.dock.betLevel.text)).toFixed(2).toString();
		}
		
		public function onBringMoney():void{
			
			if(SlotMain.running){
				return;
			}
			MySoundManager.getInstance().playVoiceSound("common");
			//sentNotification(GameNotification.SLOT_SHOW_BONUS);
			sentNotification(GameNotification.GET_USER_BALANCE,false);
		}
		
		
		public function updateReward(handler:Handler=null):void{
			this._rewardTween = 0;
			var reward:Number = roomData.reward || 0;
			if(reward > 0){
				Log.debug("RoomMediator updateReward=============>",reward);
				if(!roomData.isBigWin){
					MySoundManager.getInstance().playVoiceSound("zhongjiang");
				}
				
				Tween.to(this,{_rewardTween:reward*100 ,update:new Handler(this,onRewardUpdate)},1000,Ease.backOut,Handler.create(this,onRewardUpdateEnd,[handler]));
			}
			else{
//				getRoom().dock.start.disabled = false;
//				this.setBtnDisable(false);
				if(handler){
					handler.run();
				}
				
			}
			//viewComponent.dock.reward.text = roomData.reward || 0;
		}
		
		public function onRewardUpdate():void{
			this._rewardTween++;
			if(this._rewardTween > roomData.reward*100){
				this._rewardTween = roomData.reward*100;
			}
			viewComponent.dock.reward.text = "$"  + (this._rewardTween/100).toFixed(2).toString() ;
		}
		
		public function onRewardUpdateEnd(handler:Handler=null):void{
			getRoom().dock.start.disabled = false;
			this.setBtnDisable(false);
			if(handler){
				handler.run();
			}
		}
		
		
		public function setDockVisible(b:Boolean):void{
			viewComponent.dock.visible = b;
			viewComponent.chinadolls.visible = b;
			viewComponent.system.visible = b;
			viewComponent.img_system.visible = b;
			viewComponent.setup.visible = false;
			viewComponent.btn_return.visible = b;
			viewComponent.img_return.visible = b;
		}
		
		
		public function setBtnDisable(b:Boolean):void{
			getRoom().dock.btn_add.disabled = b;
			getRoom().dock.btn_auto.disabled = b;
			getRoom().dock.btn_bet.disabled = b;
			getRoom().dock.btn_common.disabled = b;
			getRoom().dock.btn_fast.disabled = b;
			getRoom().dock.btn_lines.disabled = b;
		}
		
		public function onSetUp():void{
			MySoundManager.getInstance().playVoiceSound("common");
			getRoom().setup.visible = !getRoom().setup.visible;
		}
		
		public function onMusic():void{
			MySoundManager.getInstance().playVoiceSound("common");
			sentNotification(MusicSetMediator.SHOW_MUSIC_SET_PANEL);
		}
		
		public function onRule():void{
			MySoundManager.getInstance().playVoiceSound("common");
			sentNotification(RuleMediator.SHOW_RULE_PANEL);
		}
		
		
		public function onStop():void{
			MySoundManager.getInstance().playVoiceSound("common");
			if(SlotMain._wheelResult && SlotMain.getInstance().allStarted){
				SlotMain.getInstance().setStopResult();
				getRoom().dock.start.disabled = true;
				SlotMain.getInstance().onStop();
				getRoom().dock.start.visible = true;
				getRoom().dock.btn_stop.visible = false;
			}
			
		}
		
		
		public function onSpeed():void{
			
			if(SlotMain.running){
				return;
			}
			
			if(roomData.speed){
				roomData.speed = false;
				getRoom().dock.btn_fast.visible = true;
				getRoom().dock.btn_common.visible = false;
				MySoundManager.getInstance().playVoiceSound("fast");
			}
			else{
				MySoundManager.getInstance().playVoiceSound("common");
				roomData.speed = true;
				getRoom().dock.btn_fast.visible = false;
				getRoom().dock.btn_common.visible = true;
			}
		}
		
		public function onReturn():void{
			//dispose();
			//返回平台
			//getRoom().destroyChildren();
			var ws:WebService = getModel(WebService.NAME) as WebService;
			ws.goback(Handler.create(this, onGoback));
		}
	
		public function onGoback():void{
			
		}
		
		public function startTest():void{
			Log.debug("RoomMediator start=====>");
			getRoom().autopanel.visible = false;
			if(SlotMain.running){
				return ;
			}
			
			MySoundManager.getInstance().playVoiceSound("slot");
			var obj:Object = new Object();
			obj.line = parseInt(viewComponent.dock.linenum.text);
			obj.bet = parseInt(viewComponent.dock.betLevel.text);
			if( (roomData.bet*roomData.lines)/100 > userInfoData.balance){
				Alert.show(Light.language.getSrting("alert_msg10"), "",AlertSimplePanel,null, Handler.create(this, gotoRecharge));
				roomData.status = RoomStatus.ROOM_COMMON;
				roomData.autoSlotNum = 0;
				return;
			}
			getRoom().dock.start.visible = false;
			getRoom().dock.btn_stop.visible = true;
			getRoom().dock.btn_stop.disabled = true;
			roomData.reward = 0;
			viewComponent.dock.reward.text = "0";
			
			SlotMain.getInstance().onSlot(new Handler(this , onSlotEnd));
			
		}
		
		public function goToBonus():void{
			sentNotification(GameNotification.SLOT_SHOW_BONUS);
		}
		
		public function goToFreeGame():void{
			roomData.status = RoomStatus.ROOM_FREE_GAME;
			sentNotification(GameNotification.SLOT_FREE_GAME);
		}
		
	}
}