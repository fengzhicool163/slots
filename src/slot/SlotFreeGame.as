package slot
{
	import com.lightUI.manager.timer.Timer;
	
	import chinadolls.model.MySoundManager;
	
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.events.Event;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Tween;

	public class SlotFreeGame
	{
		//免费游戏６
		private static var _instance:SlotFreeGame = null;
		private var _slot:*;
		private var freegame:String = "res/ani/effects_ani11.sk";
		public var templet:Templet;
		public var curskeleton:Skeleton; 
		private var _tweenReward:Number = 0;
		private var _timer:Timer;
		private var _rewardMoney:Number=0;
		public function SlotFreeGame()
		{
		}
		
		public static function getInstance():SlotFreeGame{
			if(!SlotFreeGame._instance){
				SlotFreeGame._instance = new SlotFreeGame();
			}
			return SlotFreeGame._instance;
		}
		
		public function init(slot:*):void{
				this._slot = slot;
		}
		
		public function play():void{
			show();
		}
		
		
		public function show():void{
			
			this._slot.freegame.visible = true;
			this._slot.rewardPanle.visible = true;
			if(curskeleton){
				curskeleton.removeSelf();
			}
			if(!templet){
				templet = new Templet();
				templet.on(Event.COMPLETE, this, onTempletComplete);
				templet.loadAni(freegame);
			}else{
				onTempletComplete();
			}
		}
		
		private function onTempletComplete():void
		{
			curskeleton = templet.buildArmature(0);
			curskeleton.pos(600,600);
			curskeleton.play(0,true);
			this._slot.freegame.addChild(curskeleton);		
		}
		
		public function playEnd():void{
			this._slot.freegame.visible = false;
			this._slot.rewardPanle.visible = false;
			curskeleton.removeSelf();
			
		}
		
		public function updateFreeNum(num:int):void{
			this._slot.freenum.text = num.toString();
		}
		
		public function updateReward(num:Number,handler:Handler=null):void{
			this._tweenReward = 0;
			_rewardMoney = num;
			if(!num){
				if(handler){
					handler.run();
				}
				this._slot.freeReward.text = "0";
			}
			else{
				Tween.to(this , {_tweenReward:num*100,update:new Handler(this,tweenReward)},2000,Ease.backOut , Handler.create(this , tweenEnd,[handler]));
			}
			
			//this._slot.freeReward.text = num.toFixed(2).toString();
		}
		
		public function tweenReward():void{
			this._tweenReward++;
			if(this._tweenReward > this._rewardMoney*100){
				this._tweenReward =this._rewardMoney*100;
			}
			this._slot.freeReward.text = (this._tweenReward/100).toFixed(2).toString();
		}
		
		
		public function tweenEnd(handler:Handler= null):void{
			if(handler){
				handler.run();
			}
		}
	}
}