package view.room
{
	import com.lightUI.logging.Log;
	
	import chinadolls.util.PokerTypeUtil;
	
	import laya.events.Event;
	import laya.ui.Box;
	import laya.ui.Image;
	import laya.ui.Label;
	
	public class TrendBoxListRender extends Box
	{
		private var imgBg:Image;
		private var txtPoker:Label;
		
		public function TrendBoxListRender()
		{
			super();
			this.once(Event.ADDED,this, onAdded);
		}
		
		private function onAdded():void{
			txtPoker = getChildByName("txtPoker") as Label;
			imgBg = getChildByName("imgBg") as Image;
		}
		
		
		override public function set dataSource(value:*):void{
			if(value == null) return;
			super.dataSource = value;
			var ary:Array = PokerTypeUtil.getPokerWord(value);
			Log.debug("录单数组：",ary[0].url);
			imgBg.skin = ary[0].url;
			txtPoker.text = ary[1];
		}
	}
}