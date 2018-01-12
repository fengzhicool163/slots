package action
{
	import com.lightUI.core.Light;
	
	import laya.display.Node;
	import laya.events.Event;
	import laya.ui.Image;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.TimeLine;
	import laya.utils.Tween;

	public class PlayLargeSprite extends Action
	{
		private var _container:Node;
		private var _lines:int ;
		private var _icon:int;
		private var _img:Image;
		private var _callback:Handler;
		private var _timeline:TimeLine;
		private var _autoRemove:Boolean = true;
		private var _baseScale:Number = 0;
		private var _endScale:Number = 0.5;
		public function PlayLargeSprite( container:* ,line:int , icon:int)
		{
			super();
			this._container = container;
			this._lines = line;
			this._icon = icon;
			
		}
		
		public function get endScale():Number
		{
			return _endScale;
		}

		public function set endScale(value:Number):void
		{
			_endScale = value;
		}

		public function get baseScale():Number
		{
			return _baseScale;
		}

		public function set baseScale(value:Number):void
		{
			_baseScale = value;
		}

		public function get autoRemove():Boolean
		{
			return _autoRemove;
		}

		public function set autoRemove(value:Boolean):void
		{
			_autoRemove = value;
		}

		public function setCallBack(callback:Handler):void{
			this._callback = callback;
		}
		
		
		override public function start(complete:Handler=null):void{
			this._complete = complete;
			this._img = new Image();
			var url:String = "slots/icon_" + this._icon + "_big" + ".png";
			this._img.source = Light.loader.getRes(url);
			this._img.anchorX = 0.5;
			this._img.anchorY = 0.5;
			this._container.addChild(this._img);
			//var gapy:int = Math.round(( this._img.height)/2);
			this._img.y = (2*this._lines+1) * (475/6);  // + gapy;
			this._img.x = Math.round(164/2);
			
			//this._img.pivotX = this._img.width*0.5;
			//this._img.pivotY = 0.5*this._img.height;
			
			this._img.scale(0,0);
			//Tween.to(this._img ,{scaleX:1,scaleY:1} ,200,null,new Handler(this ,playNext));
			//onEnd();
			playNext();
		}
		
		
		public function playNext():void{
			var sc:Number = 1;
			if(this._icon == 1){
				sc = 0.6;
			}
			else if(this._baseScale){
				sc = this._baseScale;
			}
			this._timeline = TimeLine.to(this._img , {scaleX:sc,scaleY:sc,ease:Ease.elasticOut},200).to(this._img , {scaleX:sc,scaleY:sc} , 1800).to(this._img , {scaleX:this._endScale,scaleY:this._endScale},200);
			this._timeline.on(Event.COMPLETE,this ,playEffect);
			this._timeline.play();
		}
		
		public function playEffect():void{
			//var effect:PlayEffect = new PlayEffect(null , this._container,"res/atlas/effects_ani06.json",this._lines,false);
			var effect:PlayAnimationBox = new PlayAnimationBox(null ,this._container ,"effects_ani06",this._lines , false);
			effect.setCallBack(Handler.create(this , onEnd));
			ActionManager.getInstance().addAction(effect).play();
		}
		
		public function onEnd():void{
			
			
			if(this._complete){
				this._complete.run();
			}
			if(this._callback){
				this._callback.run();
				this._callback = null;
			}
			if(this._autoRemove){
				this._img.removeSelf();
			}
			
		}
		
		
		override public function destory():void{
			if(this._timeline){
				this._timeline.pause();
				this._timeline.destroy();
				this._container.removeChildren();
			}
		}
	}
}