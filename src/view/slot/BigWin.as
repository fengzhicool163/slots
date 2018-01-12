package view.slot
{
	import com.lightUI.manager.PopupManager;
	
	import laya.events.Event;

	import ui.ui.bigwin.BigWinUI;
	
	
	public class BigWin extends BigWinUI
	{
		public function BigWin()
		{
			super();
			on(Event.ADDED , this , onAdded);
		}
		
		public function onAdded():void{
			//on(Event.CLICK , this , closeWindow);
			
		}
		
		
		public function closeWindow():void{
			PopupManager.removePopUp(this);
			visible = false;
		}
		
	
	}
	
	

}