package slot
{
	import com.lightUI.manager.timer.Timer;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.model.MySoundManager;
	
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.events.Event;
	import laya.utils.Handler;
	
	import view.slot.Transitions;

	public class SlotTransitions
	{
		private var _slot:Transitions;
		private static var _instance:SlotTransitions;
		public var curskeleton:Skeleton; 
		public var templet:Templet;
		private var _handler:Handler;
		private var _timeout:int;
		private var _effectName:String = "res/ani/guochang.sk";
		private var _isBonus:Boolean = false;
		public function SlotTransitions()
		{
		}
		
		public static function getInstance():SlotTransitions{
			if(!SlotTransitions._instance){
				SlotTransitions._instance = new SlotTransitions();
			}
			return SlotTransitions._instance;
		}
		
		public function init(slot:Transitions):void{
			this._slot = slot;
			
		}
		
		public function show(isbonus:Boolean , timeout:int= 0 , handler:Handler=null):void{
			this._handler = handler;
			this._timeout = timeout;
			this._isBonus = isbonus;
			this._slot.huode.visible = true;
			this._slot.ani1.play(0,false);
			
			if(this._isBonus){
				this._slot.free.visible = false;
				this._slot.bonus.visible = true;
				
				this._slot.ani3.play(0,false);
			}
			else{
				this._slot.bonus.visible = false;
				this._slot.free.visible = true;
				this._slot.ani2.play(0,false);
			}
			templet = new Templet();
			templet.on(Event.COMPLETE, this, onLoaded);
			templet.loadAni(this._effectName);
			if(this._timeout){
				var timer:Timer = new Timer();
				timer.setTimeout(this, onHandler , this._timeout,null);
			}
		}
		
		public function onHandler():void{
			if(this._handler){
				this._handler.run();
			}
		}
		
		public function onLoaded(param:*):void{
			curskeleton = templet.buildArmature(0);
			curskeleton.pos(200,330);
			curskeleton.play(0,false);
			curskeleton.on(Event.STOPPED , this, transition,[true]);
			this._slot.transitions.addChild(curskeleton);		
		}
		
		public function transition(isPlayMusic:Boolean= false):void{
			curskeleton.off(Event.STOPPED , this , transition);
			var timer:Timer = new Timer();
			timer.setTimeout(this , playExit , 2000 ,isPlayMusic);
			
		}
		
		
		public function playExit(isPlayMusic:Boolean=false):void{
			curskeleton.play(1,false);
			curskeleton.on(Event.STOPPED , this, clear,[isPlayMusic]);
		}
		
		public function clear(isPlayMusic:Boolean= false):void{
			curskeleton.removeSelf();
			if(isPlayMusic){
				MySoundManager.getInstance().playVoiceSound("dajiangchufa");
			}
		
			
			this._slot.transitions.removeChildren();
			if(!this._timeout && this._handler){
				this._handler.run();
			}
		}
		
		public function exit(timeout:int= 0,handler:Handler=null):void{
			//this._timeout = 0;
			this._handler = handler;
			curskeleton = templet.buildArmature(0);
			curskeleton.pos(200,330);
			this._slot.transitions.addChild(curskeleton);
			curskeleton.play(0,false);
			curskeleton.on(Event.STOPPED,this,this.transition,[false]);
			//curskeleton.off(Event.STOPPED , this , transition);
			//this.playExit();
			if(timeout){
				var timer:Timer = new Timer();
				timer.setTimeout(this, onHandler , timeout,null);
			}
		}
		
	
	}
}