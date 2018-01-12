package chinadolls.command
{
	import com.aaron.ls.v2.bitswarm.LSMessage;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import com.lightUI.components.alert.Alert;
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.model.data.RoomData;
	import chinadolls.model.data.UserInfoData;
	import chinadolls.model.param.SlotResultParam;
	import chinadolls.proto.BonusRequest;
	import chinadolls.proto.ExMSG;
	import chinadolls.proto.ExMessageID;
	import chinadolls.service.SlotSocketService;
	
	import view.alert.AlertPanel;
	import view.alert.AlertSimplePanel;
	
	public class BonusCommand extends Command implements ICommand
	{
		public function BonusCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			Log.debug("BetCommand ",notification.getBody())
			if(notification.getName() == ExMessageID.BONUS_RESPONSE.toString()){
				bonusResponseHandler(notification.getBody() as LSMessage)
			}
			else if(notification.getName() == GameNotification.SLOT_BONUS){
				bonusReq(notification.getBody() as BonusRequest);
			}
			else if(notification.getName() == GameNotification.SLOT_BONUS_END){
				var hallSocketService:SlotSocketService = getModel(SlotSocketService.NAME) as SlotSocketService;
				hallSocketService.bonusEndRequest();
			}
		}
		
		public function bonusResponseHandler(msg:LSMessage):void{
			Log.debug("BonusCommand bonusResponseHandler  ===>" ,msg); 
			if(msg.error){
				Alert.show(Light.error.getError("513"),"" ,AlertSimplePanel);
			}
			else{
				var emsg:ExMSG = msg.extendMsg as ExMSG;
				var winLocation:int = emsg.bonusResponese.winLocation;
				var winAmount:int = emsg.bonusResponese.winAmount;
				var currentBalance:Number = emsg.bonusResponese.currentBalance;
				var user:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
				var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
				var num:int =currentBalance - user.balance*100;
				roomData.reward = num >0 ? (num/100):0;
				user.balance = currentBalance / 100;
				sentNotification(GameNotification.SLOT_BONUS_RESULT,emsg.bonusResponese);
				
			}
		}
		
		public function bonusReq(param:Object):void{
			var hallSocketService:SlotSocketService = getModel(SlotSocketService.NAME) as SlotSocketService;
			hallSocketService.bonusRsq(param.betLocation);
		}
	}
}