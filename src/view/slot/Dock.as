package view.slot
{
	
	import com.lightMVC.interfaces.INotification;
	import com.lightUI.logging.Log;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.model.param.CarryInParam;
	
	import ui.ui.slots.DockUI;
	
	public class Dock extends DockUI
	{
		public function Dock()
		{
			super();
		}
		
		
		public function setName(name:String):void{
			username.text = name;
		}
		
		
		
		
		public function updateCash(num:int):void{
			cash.text = num.toString();
		}
		
		
		public function updateReward(num:int):void{
			reward.text = num.toString();
		}
		
		public function updateBet(bet:int):void{
			betLabel.text = bet.toString();
		}
	}
}