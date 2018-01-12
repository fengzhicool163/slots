package action
{
	import laya.display.Animation;
	import laya.display.Sprite;
	import laya.utils.Handler;
	
	import ui.ui.slots.AnimBoxUI;
	
	import view.slot.AnimBox;

	public class PlayAnimationBox extends Action
	{
		
		public  var _container:Sprite;
		public var _name:String;    //播放特效的名字
		public var _lines:int;       // 第几个位置
		public var _isLoop:Boolean=true;
		public var _callback:Handler;
		public var _scale:Number;
		public function PlayAnimationBox(target:* , container:* , name:String , line:int ,loop:Boolean,scale:Number=1)
		{
			super();
			this._container = container;
			this._target = target;
			this._name = name;
			this._lines = line;
			this._isLoop = loop;
			this._scale = scale;
		}
		
		public function setCallBack(callback:Handler):void{
			this._callback = callback;
		}
		
		
		override public function start(complete:Handler=null):void{
			this._complete = complete;
			//			var templet:Templet = new Templet();
			//			
			//			templet.on(Event.COMPLETE, this, onTempletComplete,[this._lines,templet]);
			//			templet.loadAni(this._name);
			
			var ani:AnimBox = new AnimBox();
			var y = (475/3)*this._lines - ani.height/2 + (475/6);
			ani.pos(this._container.width/2-ani.width/2,y);
			var scale:Number = 1;
			if(this._scale!=1){
				scale = this._scale;
			}
			ani.play(this._name,this._isLoop,Handler.create(this , onPlayEnd),scale);
			this._container.addChild(ani);
		}
		
		public function onPlayEnd(spr:Animation = null):void{
			//this._container.removeChildren();
			if(spr){
				spr.removeSelf();
			}
			if(this._complete){
				this._complete.run();
				this._complete = null;
			}
			if(this._callback){
				this._callback.run();
				this._callback = null;
			}
			
		}
		
	}
}