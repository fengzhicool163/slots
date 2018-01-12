package view.room
{
	import chinadolls.util.PokerTypeUtil;
	
	import laya.events.Event;
	import laya.ui.Box;
	import laya.ui.Image;
	import laya.ui.Label;

	public class AwardRecordListRender extends Box
	{
		private var imgBg:Image;
		private var txtPokerType:Label;
		public function AwardRecordListRender()
		{
			super();
			this.once(Event.ADDED,this, onAdded);
		}
		
		private function onAdded():void{
			txtPokerType = getChildByName("txtPokerType") as Label;
			imgBg = getChildByName("imgBg") as Image;
		}
		
		
		override public function set dataSource(value:*):void{
			if(value == null) return;
			super.dataSource = value;
			var ary:Array = PokerTypeUtil.getPokerWord(value);
			imgBg.skin = ary[0].url;
			txtPokerType.text = ary[1];
			
		}
		
		
	}
}