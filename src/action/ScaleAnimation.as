package action
{
	import laya.ui.Image;
	import laya.utils.Handler;
	import laya.utils.TimeLine;

	public class ScaleAnimation extends Action
	{
		private var _container:*;
		private var _line:int;
		private var _tween:TimeLine;
		public function ScaleAnimation(container:* , line:int)
		{
			super();
			this._container = container;
			this._line = line;
		}
		
		override public function start(complete:Handler=null):void{
			this._complete = complete;
			var spr:Image = this._container.getChildByName(this._line.toString());
			if(spr){
				this._tween = new TimeLine();
				this._tween.to(spr , {scaleX:1.05,scaleY:0.95},300).to(spr,{scaleX:1,scaleY:1},300).to(spr,{scaleX:1,scaleY:1},3000).play(0,true);
			}
			
			//onEnd();
		}
		
		override public function destory():void{
			if(this._tween){
				this._tween.pause();
				this._tween.destroy();	
			}
			
		}
	}
}