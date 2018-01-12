package chinadolls.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInEvent;
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInPanel;
	import com.lightUI.KGameComponents.assetsInPanel.AssetsVO;
	import com.lightUI.components.alert.Alert;
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	import com.lightUI.manager.timer.Timer;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.model.data.UserInfoData;
	import chinadolls.model.param.CarryInParam;
	import chinadolls.service.PreLoadService;
	import chinadolls.service.WebService;
	
	import laya.utils.Handler;
	
	import msg.ENCSType;
	
	import slots.service.RoomSocketService;
	
	import view.alert.AlertPanel;
	import view.alert.AlertSimplePanel;
	
	
	public class AssetInMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "assetInMediator";
		
		
		private var first:Boolean;
		public var preLoadService:PreLoadService;
		private var roomMediator:RoomMediator;
		private var timer:Timer = new Timer();
		public function AssetInMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
	
		
		private function showPanel():void{
//			Light.layer.top.addChild(viewComponent);
		}
		
		private function hidePanel():void{
//			Light.layer.top.removeChild(viewComponent);
		}
		
		override public function getInjector():Array{
			return ["preLoadService","roomMediator"];
		}
		
		private function getAssetsPanel():AssetsInPanel{
			return viewComponent as AssetsInPanel;
		}
		
		override public function setViewComponent(viewComponent:Object):void{
			super.viewComponent = viewComponent;
			
			getAssetsPanel().visible = false;
			getAssetsPanel().mouseThrough = true;
			addNotifiction(GameNotification.SHOW_CARRY_IN_PANEL);
			getAssetsPanel().on(AssetsInEvent.OK, this, onCommitCarryIn);
			getAssetsPanel().on(AssetsInEvent.CANCEL,this, onCancelCarryIn);
			
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == GameNotification.SHOW_CARRY_IN_PANEL){
				Log.debug("SHOW_CARRY_IN_PANEL Handler");
				carryInPanelShow(notification.getBody() as CarryInParam);
			}
		}
		private var timerId:int;
		private function carryInPanelShow(param:CarryInParam):void{
			first = param.isFirst;
			if(first){
				timerId = timer.setTimeout(this, countCarryInTime, 30000, null);
			}
			var max:Number = param.betMax;
			if(param.betMax > 5000000){
				var user:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
				max = (5000000 - user.balance);
				max = max <=0 ? 1:max;
			}
			//现金带入需要把步长设成0.01	
			getAssetsPanel().assetsIn(param.betMin, max, param.carrayType, param.betMin, param.cash, param.coin, param.nm, 0.01);
			getAssetsPanel().roomName = param.roomName;
			getAssetsPanel().visible = true;
		}
		
		private function countCarryInTime():void{
			Alert.show(Light.language.getSrting("alert_msg15"),"",AlertSimplePanel,null,Handler.create(this,onCancelCarryIn),null, 3000);
		}
		
		private function onTimeOver(data:int, flg:String):void{
			onCancelCarryIn(null);
		}
		
		private function onCancelCarryIn(e:AssetsInEvent):void
		{
			//退出房间消息
			if(first){
				var ws:WebService = getModel(WebService.NAME) as WebService;
				ws.goback(Handler.create(this, onGoback));
				//roomMediator.exitRoom();
			}
			timer.clearTimeout(timerId);
			getAssetsPanel().close();
		}
		
		private function onGoback():void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onCommitCarryIn(vo:AssetsVO):void
		{
			timer.clearTimeout(timerId);
			Log.debug("amountCash: "+vo.amount_cash+"amount_nm: "+vo.amount_nm+"amount_total: "+vo.amount_total);
			sentNotification(GameNotification.CARRAY_IN_MONEY, vo);
			getAssetsPanel().close();
		}
		
	}
}