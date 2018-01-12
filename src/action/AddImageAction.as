package action
{
	import com.lightUI.core.Light;
	
	import laya.ui.Image;
	import laya.utils.Handler;
	import laya.utils.Tween;

	public class AddImageAction extends Action
	{
		public var icon:String;
		public var line:int;
		public var container:*;
		public var _itemHeight:Number;
		public var _containerHeight:Number;
		public var _visibleWidth:Number;
	
		public function AddImageAction(icon , line:int ,container:*, itemHeight:Number , containerWidth:Number , visibleWidth:Number , handler:Handler=null)
		{
			super();
			this.icon = icon;
			this.line = line;
			
			this._complete = handler;
			this.container = container;
			this._itemHeight = itemHeight;
			this._containerHeight = containerWidth;
			this._visibleWidth = visibleWidth;
		}
		
		override public function start(complete:Handler=null):void{
			var s:Image = new Image();
			var url:String = "slots/icon_" + icon + ".png";
			s.source = Light.loader.getRes(url);
			s.name = this.line.toString();
			s.anchorX = 0.5;
			s.anchorY = 0.5;
			this.container.addChild(s);
			var gapy:int = Math.round((this._itemHeight)/2);
			s.y = 2*this.line * this._containerHeight + gapy;
			s.x = Math.round((this._visibleWidth)/2);
		
		}
	}
}