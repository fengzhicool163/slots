package chinadolls.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import com.lightUI.KGameComponents.assetsInPanel.CurrencyType;
	import com.lightUI.components.alert.Alert;
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.model.AppModel;
	import chinadolls.model.data.ConstData;
	import chinadolls.model.data.HallData;
	import chinadolls.model.data.MoneyType;
	import chinadolls.model.data.RoomData;
	import chinadolls.model.data.UserInfoData;
	import chinadolls.model.param.CarryInParam;
	import chinadolls.model.vo.HallRoomVO;
	import chinadolls.service.WebService;
	import chinadolls.util.AlertTextUtil;
	import chinadolls.util.MoneyUtils;
	
	import laya.utils.Browser;
	import laya.utils.Handler;
	
	import view.alert.AlertSimplePanel;
	
	public class UserBalanceCommand extends Command implements ICommand
	{
		private var _firstEnter:Boolean;
		public function UserBalanceCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == GameNotification.GET_USER_BALANCE){
				onUserBalanceHandler(notification.getBody() as Boolean);
			}
			else if(notification.getName() == GameNotification.GET_USER_INFO){
				onUserInfoHandler();
			}
		}
		
		private function onUserBalanceHandler(firstEnter:Boolean = false):void
		{
			_firstEnter = firstEnter;
			var ws:WebService = getModel(WebService.NAME) as WebService;
			ws.getUserBalance(new Handler(this, userBalanceCallback));
			
		}		
		
		private function userBalanceCallback(param:Object):void{
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			roomData.id = 1;
//			sentNotification(GameNotification.SHOW_CARRY_IN_PANEL, carryInParam);
//			return;
			//如果房间不存在不处理
			if(roomData.id){
				var appModel:AppModel = getModel(AppModel.NAME) as AppModel;
				//弹出带入面板
				
				//判断房间是否存在
			
				var carryInParam:CarryInParam  = new CarryInParam(param);
				var userInfo:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
			
				//carryInParam.roomName = AlertTextUtil.getEnterRoomText(roomVO.chipsType, Light.roomName.getSrting(roomVO.id.toString()));
				//carryInParam.betMin = MoneyUtils.getCashChange(roomVO.chipsType,roomVO.betMin);
				carryInParam.isFirst = _firstEnter;
				carryInParam.betMin = 1;
				//carryInParam.carrayType = roomVO.chipsType == CurrencyType.COIN ? CurrencyType.COIN : roomData.nm ? CurrencyType.CASHANDNM: CurrencyType.CASH;
				carryInParam.carrayType = CurrencyType.CASH;
				carryInParam.roomName = Light.language.getSrting("cashType");
//				sentNotification(GameNotification.SHOW_CARRY_IN_PANEL, carryInParam);
//				return;
				
		
					
				if(!checkInByBalanceEnough(carryInParam)){
					//余额不足去充值
					Alert.show(Light.language.getSrting("alert_msg10"), "",AlertSimplePanel,null, Handler.create(this, gotoRecharge));
				}else{
						sentNotification(GameNotification.SHOW_CARRY_IN_PANEL, carryInParam);
				}
				
			}
		}
		
		private function gotoRecharge(data:int,flg:String):void{
		
				//去充值页面			
//				var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
//				var ws:WebService = getModel(WebService.NAME) as WebService;
//				var type:String = getPlateType(MoneyType.CASH);
//				ws.recharge(type, Handler.create(this, onRecharge));
				//Browser.window.open("http://www.baidu.com","_blank");
			
		}
		
		private function getPlateType(type:int):String{
			if(type == MoneyType.CASH){
				return "cash";
			}
			return "coin";
		}
		
		private function onRecharge():void{
			Log.debug("-------------------recharge");
		}
		
		private function checkInByBalanceEnough(param:CarryInParam):Boolean{
			
			if((param.carrayType == CurrencyType.COIN && param.coin < param.betMin) || (param.carrayType == CurrencyType.CASHANDNM && (param.cash + param.nm) < param.betMin) || (param.carrayType == CurrencyType.CASH && param.cash < param.betMin)){
				return false;
			}
			return true;
//			sentNotification(CarNotification.SHOW_CARRY_IN_PANEL, param);
		}
		
		
		private function onUserInfoHandler():void{
			var ws:WebService = getModel(WebService.NAME) as WebService;
			var appModel:AppModel = getModel(AppModel.NAME) as AppModel;
			if(appModel.isLocal){
				var param:Object = new Object();
				param.avatar = "http://statics.kgame63.com/common/images/avatars/1.png";
				param.cash = 999999;
				param.username = "david";
				getUserInfo(param)
			}else{
				ws.getUsersInfo(new Handler(this, getUserInfo));
			}
			
		}
		
		private function getUserInfo(param:Object):void{
			var udata:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
			udata.name = param.username;
			udata.headIcon = param.avatar;
			trace("UserBalanceCommand getUserInfo========>",param);
			sentNotification(GameNotification.SHOW_USER_NAME,udata);
		}
		
	}
}