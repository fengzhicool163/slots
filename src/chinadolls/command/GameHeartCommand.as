package chinadolls.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	
	import slots.service.HallHeartService;
	
	import msg.ENCSType;
	
	public class GameHeartCommand extends Command implements ICommand
	{
		public function GameHeartCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName().toString() == ENCSType.CS_TYPE_HEART_BEAT_RSP.toString()){
				hallHeartRspHandler();
			}
		}
		
		private function hallHeartRspHandler():void
		{
			// TODO Auto Generated method stub
//			var appModel:AppModel = getModel(AppModel.NAME) as AppModel;
//			if(appModel.state != AppModel.HALL_STATE) return;
			
			var heartService:HallHeartService = getModel(HallHeartService.NAME) as HallHeartService;
			heartService.heartResponese();
		}		
		
	}
}