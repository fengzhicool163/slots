package slot
{
	import chinadolls.model.MySoundManager;
	import chinadolls.model.data.RoomData;

	public class SlotSoundLogic
	{
		private static var _instance:SlotSoundLogic;
		public function SlotSoundLogic()
		{
		}
		
		public static function getInstance():SlotSoundLogic{
			if(!SlotSoundLogic._instance){
				SlotSoundLogic._instance = new SlotSoundLogic();
			}
			return SlotSoundLogic._instance;
		}
		
		public function playSymbolTwo():void{
			var n:int = SlotMain.getSlotResult().numbersOfTwo();
			var str:String = "onetwo";
			if(n == 1){
				str = "onetwo";
				MySoundManager.getInstance().playVoiceSound(str);
			}
			else if(n == 2){
				str = "twotwo";
				MySoundManager.getInstance().playVoiceSound(str);
			}
			else if(n >=3){
				str = "threetwo";
				MySoundManager.getInstance().playVoiceSound(str);
			}
			
		}
		
		
		public function playRewardTrigger():void{
			var roomData:RoomData = SlotMain.getInstance().getRoomData();
			if(!roomData.isBigWin){
				MySoundManager.getInstance().playVoiceSound("xiaojiangchufa");
			}
			
		}
		
		
	}
}