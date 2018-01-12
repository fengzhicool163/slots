package chinadolls.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import com.lightUI.logging.Log;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.mediator.HallMediator;
	import chinadolls.model.AppModel;
	import chinadolls.model.GameProtoModel;
	import slots.service.HallSocketService;
	
	import msg.CS;
	import msg.ENCSType;
	
	public class HallHeartBeatCommand extends Command implements ICommand
	{
		public function HallHeartBeatCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == GameNotification.HALL_HEART_BEAT.toString()){
				heartReqHandler();
			}else if(notification.getName() == ENCSType.CS_TYPE_HEART_BEAT_RSP.toString()){
				heartRspHandler(notification.getBody() as CS);
			}
		}
		
		private function heartReqHandler():void
		{
			
			
			var appModel:AppModel = getModel(AppModel.NAME) as AppModel;
			appModel.hallHeartBeat = true;
			var proto:GameProtoModel = getModel(GameProtoModel.NAME) as GameProtoModel;
			var out:CS = proto.msg_proto.getCS();
			out.msg_type = ENCSType.CS_TYPE_HEART_BEAT_REQ;
			out.heart_beat_req = proto.msg_proto.getHeartBeatReq()
			
			var socket:HallSocketService = getModel(HallSocketService.NAME) as HallSocketService;
			socket.send(out);
		}
		
		private function heartRspHandler(cs:CS):void
		{
			var appModel:AppModel = getModel(AppModel.NAME) as AppModel;
			if(!appModel.hallHeartBeat) return;
			appModel.hallHeartBeat = false;
			(getMediator(HallMediator.NAME) as HallMediator).receiveHeartBeat();
		}
	}
}