package view.room
{
	import laya.events.Event;
	
	import ui.ui.room.BetTotalAmountUI;
	
	public class BetTotalAmount extends BetTotalAmountUI
	{
		public function BetTotalAmount()
		{
			super();
			this.on(Event.ADDED, this, onAdded);
		}
		
		private function onAdded():void{
			txt_totalBet.font = "betAmount";
		}
	}
}