package view.slot
{
	import chinadolls.service.SlotSocketService;
	
	import laya.events.Event;
	
	import ui.ui.slots.RoomUI;
	import chinadolls.events.GameEvent;
	public class Room extends RoomUI
	{
		public function Room()
		{
			super();
			
			on(Event.ADDED , this , onAdded);
		}
		
		public function onAdded():void{
			dock.start.on(Event.CLICK , this , start);
		}
		
		public function start():void{
			trace("start click!");
			event(GameEvent.START_SLOT);
		}
	}
}