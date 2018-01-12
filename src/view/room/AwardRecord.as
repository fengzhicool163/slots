package view.room
{
	import laya.events.Event;
	import laya.utils.Ease;
	import laya.utils.Tween;
	
	import ui.ui.room.AwardRecordUI;
	
	public class AwardRecord extends AwardRecordUI
	{
		public static const OPEN:int = 1; 
		public static const CLOSE:int = 0; 
		private var _states:int = 0;
		public function AwardRecord()
		{
			super();
			this.on(Event.ADDED, this, onAdded);
		}
		
		private function onAdded():void
		{
			this.btnTriangle.on(Event.CLICK, this, onTriangleClick);
			mouseThrough = true;
		}
		
		private function onTriangleClick():void
		{
			if(_states == CLOSE){
				_states = OPEN;
				btnTriangle.scaleX = -1;
				Tween.to(this,{x:70},500,Ease.circOut);
			}else{
				_states = CLOSE;
				btnTriangle.scaleX = 1;
				Tween.to(this,{x:0},500,Ease.circIn);
			}
		}
		
		public function updateLuDan(ary:Array):void
		{
			if(_states == OPEN){
				var newAry:Array = ary.concat();
				awardList.dataSource = newAry.reverse().slice(0,9);
			}
		}
	}
}