package view.slot
{
	import chinadolls.consts.GameNotification;
	import chinadolls.events.GameEvent;
	
	import laya.events.Event;
	
	import slot.SlotTest;
	
	import ui.ui.slots.SetResulteUI;
	
	public class SetResult extends SetResulteUI
	{
		private var _txArr:Array;
		public function SetResult()
		{
			
			super();
			this.init();
		}
		
		
		public function init():void{
			this.btn_spin.on(Event.CLICK , this , onSlot);
			this._txArr = [this.tx1,tx2,tx3,tx4,tx5,tx6,tx7,tx8,tx9,tx10,tx11,tx12,tx13,tx14,tx15];
		}
		
		public function onSlot():void{
			var arr:Array= [];
			for(var i:int=0 ; i< 15; i++){
				var value:int = parseInt(this._txArr[i].text);
				arr.push(value);
			}
			//event(GameEvent.START_SLOT);
			//event(GameNotification.SLOT_TEST,arr);
			SlotTest.getInstance().onSlot(arr);
			this.removeSelf();
			
		}
	}
}