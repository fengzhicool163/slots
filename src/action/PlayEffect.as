package action
{
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.display.Animation;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.utils.Handler;
	import laya.webgl.canvas.BlendMode;
	

	public class PlayEffect extends Action
	{
		public  var _container:Sprite;
		public var _name:String;    //播放特效的名字
		public var _lines:int;       // 第几个位置
		public var _isLoop:Boolean=true;
		public var _callback:Handler;
		public function PlayEffect(target:* , container:* , name:String , line:int ,loop:Boolean)
		{
			super();
			this._container = container;
			this._target = target;
			this._name = name;
			this._lines = line;
			this._isLoop = loop;
		}
		
		
		public function setCallBack(callback):void{
			this._callback = callback;
		}
		
		override public function start(complete:Handler=null):void{
			this._complete = complete;
//			var templet:Templet = new Templet();
//			
//			templet.on(Event.COMPLETE, this, onTempletComplete,[this._lines,templet]);
//			templet.loadAni(this._name);
			
			var ani:Animation = new Animation();
			//ani.on(Event.COMPLETE , this , onLoaded , [this._lines , ani]);
			ani.loadAtlas(this._name,Handler.create(this,onLoaded,[this._lines,ani]));
		}
		
		
		
		public function onLoaded(lines:int ,ani:Animation , icon:int):void{
			var x:Number = -25 ;
			var y:Number = (475/3)*lines - 30;
			ani.pivotY =ani.height;
			ani.pos(x,y);
			
			ani.blendMode = BlendMode.LIGHT;
			ani.name = lines.toString();
			if(!this._isLoop){
				ani.on(Event.COMPLETE , this, onPlayEnd,[ani]);
				ani.play(0,false);
				
			}
			else{
				ani.play(0,true);
				onPlayEnd();
			}
			
			this._container.addChild(ani);
		}
		
		
		public function onTempletComplete(lines:int,templet,icon:int):void{
			var curskeleton:Skeleton = templet.buildArmature(0);
			var x:Number = 82 ;
			var y:Number = (475/3)*lines;
			curskeleton.pivotY =-475/6;
			curskeleton.pos(x,y);
			curskeleton.blendMode = BlendMode.LIGHT;
			curskeleton.name = lines.toString();
			if(!this._isLoop){
				curskeleton.play(0,false);
				curskeleton.on(Event.STOPPED , this, onPlayEnd,[curskeleton]);
			}
			else{
				curskeleton.play(0,true);
				onPlayEnd();
			}
			
			this._container.addChild(curskeleton);
			
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