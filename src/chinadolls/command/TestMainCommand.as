package chinadolls.command
{
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	
	import msg.CS;
	import msg.ENCSType;
	
	public class TestMainCommand extends Command
	{
		public function TestMainCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == ENCSType.CS_TYPE_PLAYER_CANCEL_BET_REQ.toString()){
				
			}else if(notification.getName() == ENCSType.CS_TYPE_PLAYER_CANCEL_BET_RSP.toString()){
				
			}
		}
	}
}