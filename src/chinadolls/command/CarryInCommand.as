package chinadolls.command
{
	import com.IProtobuf.Long;
	import com.aaron.ls.v2.bitswarm.LSMessage;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import com.lightUI.KGameComponents.assetsInPanel.AssetsVO;
	import com.lightUI.components.alert.Alert;
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.model.GameProtoModel;
	import chinadolls.model.data.MoneyType;
	import chinadolls.model.data.RoomData;
	import chinadolls.model.data.UserInfoData;
	import chinadolls.proto.ExMSG;
	import chinadolls.proto.ExMessageID;
	import chinadolls.service.SlotSocketService;
	import chinadolls.util.MoneyUtils;
	
	import conf.Money;
	
	import laya.utils.Handler;
	
	import slots.service.RoomSocketService;
	
	import view.alert.AlertPanel;
	import view.alert.AlertSimplePanel;

	/**
	 * 带入 
	 * @author ws
	 * 
	 */	
	public class CarryInCommand extends Command implements ICommand
	{
		public function CarryInCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == GameNotification.CARRAY_IN_MONEY){
				onCarryInReques(notification.getBody() as AssetsVO);
			}else if(notification.getName() == ExMessageID.BRING_MONEY_RESPONSE){
				onCarryInResponse(notification.getBody() as LSMessage);
			}
		}
		
		
		private function onCarryInReques(vo:AssetsVO):void
		{
			// TODO Auto Generated method stub
			
			trace("vo.amount_nm:"+vo.amount_nm+"vo.amount_coin:"+vo.amount_coin+"vo.amount_cash:"+vo.amount_cash+"vo.amount_total:"+vo.amount_total+"amount_default:"+vo.amount_default)
			var roomSocketService:SlotSocketService = getModel(SlotSocketService.NAME) as SlotSocketService;
			roomSocketService.bringMoney(vo.amount_cash*100);
		}
		
		private function onCarryInResponse(msg:LSMessage):void
		{
			Log.debug("SlotSocketService bringMoneyRsp======>",JSON.stringify(msg));
			if(msg.error){
				Alert.show(Light.error.getError("413"), "",AlertSimplePanel,null, Handler.create(this, gotoRecharge));
			}
			else{
				var m:ExMSG = msg.extendMsg as ExMSG;
				var udata:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
				udata.balance = m.bringMoneyResponse.amount/100;
				Log.debug("SlotSocketService bringMoneyRsp======>",udata.balance);
				sentNotification(GameNotification.SLOT_UPDATE_UI,udata);
			}
			
		}
		
		private function gotoRecharge():void{
			
		}
	}
}