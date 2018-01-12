package view.slot
{
	import ui.ui.slots.BonusUI;
	
	public class Bonus extends BonusUI
	{
		public function Bonus()
		{
			super();
			trace('Bonus Bonus==============>');
		}
		
		
		public function setRewardNum(num:Number):void{
			rewardLabel.text = num.toString();
		}
		
		public function setRetainTime(num:String):void{
			timeLabel.text = num;
		}
	}
}