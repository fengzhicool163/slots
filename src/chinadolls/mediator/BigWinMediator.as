package chinadolls.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	import com.lightUI.manager.PopupManager;
	import com.lightUI.manager.timer.Timer;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.consts.RoomStatus;
	import chinadolls.model.MySoundManager;
	import chinadolls.model.data.RoomData;
	import chinadolls.model.data.UserInfoData;
	import chinadolls.model.param.BigWinParam;
	import chinadolls.model.vo.SlotConfigData;
	import chinadolls.service.PreLoadService;
	
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.events.Event;
	import laya.utils.Color;
	import laya.utils.Handler;
	import laya.utils.Tween;
	import laya.webgl.canvas.BlendMode;
	
	import slot.SlotMain;
	
	import view.slot.BigWin;
	
	public class BigWinMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "bigWinMediator";
		private var _rewardNum:Number = 0;
		private var curskeleton:Skeleton;
		private var _money:Number = 0;
		private var roomData:RoomData;
		public function BigWinMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function getInjector():Array{
			return [RoomData.NAME];
			
			
		}
		
		override public function setViewComponent(viewComponent:Object):void{
			super.viewComponent = viewComponent;
			getBigWin().on(Event.CLICK, this , closeWindow);
			Light.layer.top.addChild(getBigWin());
			PopupManager.centerPopUp(getBigWin());
			
			getBigWin().visible = false;
			addNotifiction(GameNotification.SLOT_SHOW_BIG_WIN_PANEL);
		}
		
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == GameNotification.SLOT_SHOW_BIG_WIN_PANEL){
				//MySoundManager.getInstance().playVoiceSound("dajiangchufa");
				var param:BigWinParam = notification.getBody() as BigWinParam;
				show(param.money);
			}
		
			
		}
		
		
		private function getBigWin():BigWin{
			return viewComponent as BigWin;
		}
		
		public function show(money:Number):void{
			this._rewardNum = 0;
			this._money = money*100;
			this.curskeleton = null;
			PopupManager.addPopUp(getBigWin(),Light.root,true, Color.create("#000000"));
			getBigWin().visible = true;
			var templet:Templet = new Templet();
			
			templet.on(Event.COMPLETE, this, onTempletComplete,[templet]);
			templet.loadAni("res/ani/coins.sk");
			Tween.to(this , {_rewardNum:this._money , update:new Handler(this,updateReward)},6000);
		}
		
		
		public function updateReward():void{
			this._rewardNum++;
			if(this._rewardNum > this._money){
				this._rewardNum = this._money;
				MySoundManager.getInstance().playVoiceSound("dajiang3");
			}
			getBigWin().rewardNum.text = (this._rewardNum/100).toFixed(2).toString();
		}
		
		
		public function closeWindow():void{
			PopupManager.removePopUp(getBigWin());
			getBigWin().visible = false;
			Tween.clearAll(this);
			MySoundManager.getInstance().stopLastVoice();
			if(this.curskeleton){
				this.curskeleton.removeSelf()
			}
			if(SlotMain.getSlotResult()){
				var isBonus:Boolean = SlotMain.getSlotResult().ISBonus();
				if(isBonus){
					sentNotification(GameNotification.SLOT_SHOW_BONUS);
					return;
				}
				var isFreeGame:Boolean = SlotMain.getSlotResult().IsFreeGameResult();
				if(isFreeGame){
					roomData.status = RoomStatus.ROOM_FREE_GAME;
					sentNotification(GameNotification.SLOT_FREE_GAME);
					return ;
				}
				
				
			}
		}
		
		
		public function onTempletComplete(templet):void{
			this.curskeleton = templet.buildArmature(0);
			var x:Number = 582 ;
			var y:Number = 300;
			//this.curskeleton.pivotY =-475/6;
			curskeleton.pos(x,y);
			//curskeleton.blendMode = BlendMode.LIGHT;
			//curskeleton.name = lines.toString();
			
			curskeleton.play(0,true);
			getBigWin().effect.addChild(curskeleton);
			MySoundManager.getInstance().playVoiceSound("dajiang1");
			var timer:Timer = new Timer();
			timer.setTimeout(this , this.playSoundEffect , 300 , null);
		}
		
		public function playSoundEffect():void{
			MySoundManager.getInstance().playVoiceSound("dajiang2" , 3);
		}
	}
}