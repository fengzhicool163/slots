package chinadolls.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	
	import chinadolls.model.data.RoomData;
	
	import msg.CS;
	import msg.ENCSType;
	
	public class SettlementRoundCommand extends Command implements ICommand
	{
		public function SettlementRoundCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == ENCSType.CS_TYPE_ROUND_CASH_NOTIFY.toString()){
				onSettlementHandler(notification.getBody() as CS);
			}
		}
		
		private function onSettlementHandler(cs:CS):void
		{
			//局结算返回
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
//			roomData.roundResult = cs.round_cash_notify.;
			
			roomData.roundResultNotify = cs.round_cash_notify;
		}
	}
}