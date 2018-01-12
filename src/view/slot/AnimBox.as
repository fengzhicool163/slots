package view.slot
{
	import laya.display.Animation;
	import laya.events.Event;
	import laya.utils.Handler;
	import laya.webgl.canvas.BlendMode;
	
	import ui.ui.slots.AnimBoxUI;
	
	public class AnimBox extends AnimBoxUI
	{
		private var _handler:Handler = null;
		public function AnimBox()
		{
			super();
		}
		
		
		
		public function play(n:String ,loop:Boolean= false,handler:Handler=null,scale:Number=1):void{
			var item:* = this[n];
			if(scale!=1){
				item.scale(scale,scale);
			}
			
			this._handler = handler;
			item.visible = true;
			item.blendMode = BlendMode.LIGHT;
			if(!loop){
				item.on(Event.COMPLETE , this , end,[item]);
			}
			
			item.play(0,loop);
		}
		
		public function end(item:*):void{
			if(item){
				item.removeSelf();
			}
			if(this._handler){
				this._handler.run();
			}
		}
	}
}