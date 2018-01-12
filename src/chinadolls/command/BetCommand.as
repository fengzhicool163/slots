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
	import chinadolls.model.param.BetParam;
	import chinadolls.model.param.SlotResultParam;
	import chinadolls.proto.BettingResponese;
	import chinadolls.proto.ExMSG;
	import chinadolls.proto.ExMessageID;
	import chinadolls.proto.GameResult;
	import chinadolls.service.SlotSocketService;
	import chinadolls.service.WebService;
	
	import laya.utils.Handler;
	
	import view.alert.AlertPanel;
	import view.alert.AlertSimplePanel;
	
	public class BetCommand extends Command implements ICommand
	{
		
		private var isLocal:Boolean = false;
		public function BetCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			Log.debug("BetCommand ",notification.getBody())
			if(notification.getName() == ExMessageID.BETTING_RESPONSE.toString()){
				betResponseHandler(notification.getBody() as LSMessage)
			}else if(notification.getName() == GameNotification.START_SLOT){
				betHandler();
			}
			else if(notification.getName() == GameNotification.SLOT_TEST){
				this.betTestHandler(notification.getBody() as Array);
			}
			else if(notification.getName() == ExMessageID.TEST_BETTING_RESPONSE.toString()){
				this.betTestResponse(notification.getBody() as LSMessage);
			}
			else if(notification.getName() == ExMessageID.LOGIN_SIGNIN_KICK.toString()){
				
				this.kickOffUser(notification.getBody() as LSMessage);
				
			}
			else if(notification.getName() == ExMessageID.SHUTDOWN_SERVER.toString()){
				
				this.kickOffUser(notification.getBody() as LSMessage);
				
			}
			
		}
		
		
		public function gotoBack():void{
		
			var ws:WebService = getModel(WebService.NAME) as WebService;
			ws.goback(Handler.create(this,this.gobackFunc));
		}

		public function gobackFunc():void{
			
		}
		
		
		private function betResponseHandler(msg:LSMessage):void{
			Log.debug("自定义数据===>" ,(JSON.stringify(msg))); 
			
			if(msg.error){
				Alert.show(Light.error.getError(msg.error.toString()), "",AlertSimplePanel,null);
			}
			else{
				var emsg:ExMSG = msg.extendMsg as ExMSG;
				var betParam:SlotResultParam = new SlotResultParam(emsg.betResponese.gameResult,emsg.betResponese.gameResult.currentBalance,emsg.betResponese.freeGameResult,emsg.betResponese.gameResult.isBonus);
				var user:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
				var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
				var num:int = betParam.getWinAmount();
				roomData.isBigWin = false;
				if(num>0 && (num/(roomData.lines*roomData.bet))>=50){
					roomData.isBigWin = true;
				}
				roomData.reward = num >0 ? (num/100):0;
				user.balance = betParam.getBalance() / 100;
				sentNotification(GameNotification.SLOT_RESULT,betParam);
				
				
			}
			
		
		}
		
		private function betHandler():void{
			if(this.isLocal){
				var emsg:ExMSG = new  ExMSG();
				emsg.betResponese = new BettingResponese();
				emsg.betResponese.gameResult = new GameResult();
				//emsg.betResponese.gameResult.resultGrid = [11,11,11,11,11,1,2,3,4,5,6,7,8,9,2];
				emsg.betResponese.gameResult.resultGrid = [10,4,5,5,5,1,7,2,9,4,6,9,1,6,8];
				var s:Object = new Object();
				s.lineid = 19;
				s.count = 3;
				s.icon = 7;
				var s2:Object = new Object();
				s2.lineid = 20;
				s2.count = 3;
				s2.icon = 4;
				var s3:Object = new Object();
				s3.lineid = 7;
				s3.count = 3;
				s3.icon = 9;
				var s4:Object = new Object();
				s4.lineid = 6;
				s4.count = 5;
				s4.icon = 5;
				var s5:Object = new Object();
				s5.lineid = 10;
				s5.count = 3;
				s5.icon = 1;
				var s6:Object = new Object();
				s6.lineid = 15;
				s6.count = 3;
				s6.icon = 1;
				
				
				emsg.betResponese.gameResult.winLines = [s];
				//emsg.betResponese.freeGameResult = [{"winLines":[{"lineid":13,"count":3,"icon":7}],"resultGrid":[9,2,8,11,9,11,7,2,11,6,7,3,7,3,10],"winAmount":75,"currentBalance":2049},{"winLines":[],"resultGrid":[8,1,7,11,6,8,8,3,11,3,4,9,2,9,2],"winAmount":-125,"currentBalance":1924},{"winLines":[],"resultGrid":[7,3,2,8,10,8,11,11,10,6,8,9,8,2,3],"winAmount":-125,"currentBalance":1799},{"winLines":[],"resultGrid":[8,9,11,9,8,11,3,9,3,10,11,10,7,6,11],"winAmount":-125,"currentBalance":1674},{"winLines":[{"lineid":23,"count":3,"icon":11},{"lineid":8,"count":3,"icon":11},{"lineid":10,"count":3,"icon":11},{"lineid":11,"count":3,"icon":11}],"resultGrid":[9,11,11,8,10,11,10,11,11,2,8,11,6,3,3],"winAmount":100,"currentBalance":1774},{"winLines":[],"resultGrid":[8,4,8,11,9,11,10,7,11,9,8,3,3,2,7],"winAmount":-125,"currentBalance":1649},{"winLines":[{"lineid":1,"count":3,"icon":10},{"lineid":8,"count":3,"icon":10}],"resultGrid":[10,10,10,9,10,10,11,11,2,8,3,11,9,3,10],"winAmount":70,"currentBalance":1719},{"winLines":[],"resultGrid":[8,8,10,10,11,8,3,6,9,2,10,2,5,3,11],"winAmount":-125,"currentBalance":1594},{"winLines":[],"resultGrid":[8,10,11,3,11,11,2,1,11,8,11,10,11,6,2],"winAmount":-125,"currentBalance":1469},{"winLines":[{"lineid":8,"count":3,"icon":11}],"resultGrid":[10,11,11,7,10,11,4,10,8,11,11,9,3,3,10],"winAmount":25,"currentBalance":1494}]
				var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
				roomData.reward = 123.25;
				emsg.betResponese.gameResult.isBonus = false;
				emsg.betResponese.gameResult.currentBalance = 100000;
				
				roomData.isBigWin = true;
				var betParam:SlotResultParam = new SlotResultParam(emsg.betResponese.gameResult,emsg.betResponese.gameResult.currentBalance,emsg.betResponese.freeGameResult,emsg.betResponese.gameResult.isBonus);
				sentNotification(GameNotification.SLOT_RESULT,betParam);
				//var param:SlotResultParam = 
				return ;
			}
		
		    var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			var user:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
//			if( roomData.bet*roomData.lines > user.balance){
//				Alert.show(Light.error.getError("403"),"" ,AlertSimplePanel);
//				return;
//			}
			
			var hallSocketService:SlotSocketService = getModel(SlotSocketService.NAME) as SlotSocketService;
			hallSocketService.slot(roomData.lines , roomData.bet);
		}
		
		
		
		public function betTestHandler(param:Array):void{
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			var user:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
			var hallSocketService:SlotSocketService = getModel(SlotSocketService.NAME) as SlotSocketService;
			hallSocketService.slotTest(roomData.lines , roomData.bet, param);
		
		}
		
		public function betTestResponse(msg:LSMessage):void{
			Log.debug("betTestResponse自定义数据===>" ,(JSON.stringify(msg))); 
			
			if(msg.error){
				Alert.show(Light.error.getError("403"),"" ,AlertSimplePanel);
			}
			else{
				var emsg:ExMSG = msg.extendMsg as ExMSG;
				var betParam:SlotResultParam = new SlotResultParam(emsg.testBetResponese.gameResult,emsg.testBetResponese.gameResult.currentBalance,emsg.testBetResponese.freeGameResult,emsg.testBetResponese.gameResult.isBonus);
				var user:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
				var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
				var num:int = betParam.getWinAmount();
				roomData.isBigWin = false;
				if(num>0 && (num/(roomData.lines*roomData.bet))>=50){
					roomData.isBigWin = true;
				}
				roomData.reward = num >0 ? (num/100):0;
				user.balance = betParam.getBalance() / 100;
				sentNotification(GameNotification.SLOT_RESULT,betParam);
				
				
			}
		}
		
		public function kickOffUser(msg:LSMessage):void{
			Log.debug("BetCommand kickOffUser==============> ");
			var hallSocketService:SlotSocketService = getModel(SlotSocketService.NAME) as SlotSocketService;
			hallSocketService._kickoffUser = true;
			Alert.show(Light.error.getError("404"), "",AlertSimplePanel,null, Handler.create(this, gotoBack));
		}
		
		
		public function shutDownServer():void{
			Log.debug("BetCommand kickOffUser==============> ");
			Alert.show(Light.error.getError("406"), "",AlertSimplePanel,null, Handler.create(this, gotoBack));
		}
		
	}
}