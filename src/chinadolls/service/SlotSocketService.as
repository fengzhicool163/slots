
package chinadolls.service
{
	import com.aaron.ls.v2.LightClinet;
	import com.aaron.ls.v2.bitswarm.LSMessage;
	import com.aaron.ls.v2.entities.IRoom;
	import com.aaron.ls.v2.entities.IUser;
	import com.aaron.ls.v2.events.LSEvent;
	import com.aaron.ls.v2.proto.LProto;
	import com.aaron.ls.v2.proto.Room;
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.parrerns.Model;
	import com.lightUI.components.alert.Alert;
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.model.AppModel;
	import chinadolls.model.data.ConstData;
	import chinadolls.model.data.UserInfoData;
	import chinadolls.model.param.SlotResultParam;
	import chinadolls.proto.ChinaDollsProto;
	import chinadolls.proto.ExMSG;
	import chinadolls.proto.ExMessageID;
	
	import laya.ani.bone.Bone;
	import laya.utils.Handler;
	
	import view.alert.AlertPanel;
	import view.alert.AlertSimplePanel;
	
	public class SlotSocketService extends Model implements IModel
	{
		private var _ls:LightClinet;
		
		
		private static  var _singleton:Boolean=true;
		private static  var _instance:SlotSocketService;
		public  var _kickoffUser:Boolean = false;
		public static const NAME:String = "SlotSocketService";
		public function SlotSocketService(modelName:String=null, data:Object=null)
		{
			super(modelName , data);
		
			
		}
		
		public function initSlotSocket(proto:LProto,exProto:ChinaDollsProto,setting:Object):void{
			//初始化相关
			_ls = new LightClinet( proto,exProto);
			_ls.setSetting(setting);
			_ls.on(LSEvent.CONNECTION,this,onConnection);
			_ls.on(LSEvent.CONNECT_FAIL , this,onConnectFailed);
			//_ls.on(LSEvent.LOGIN,this,onLogin);
			_ls.on(LSEvent.LOGIN_ERROR,this,onLoginError);
			_ls.on(LSEvent.ROOM_JOIN,this,onRoomJoin);
			_ls.on(LSEvent.ROOM_JOIN_ERROR,this,onRoomJoinError);
			_ls.on(LSEvent.USER_ENTER_ROOM,this,onUserEnterRoom);
			_ls.on(LSEvent.CONNECTION_RETRY ,this , onConnectRetry);
			_ls.on(LSEvent.CONNECTION_RESUME , this , onConnectResume);
			_ls.on(LSEvent.DISCONNECT , this , onDisConnect);
			_ls.on(LSEvent.CLOSE , this , onClose);
			_ls.on(ExMessageID.LOGIN_NOTIFY.toString(), this, loginNotify);
			
			
			
//			_ls.on(ExMessageID.BETTING_RESPONSE.toString() , this ,betRsq);
//			_ls.on(ExMessageID.BRING_MONEY_RESPONSE.toString() , this , bringMoneyRsp);
			
			//_ls.on(ExMessageID.BRING_MONEY_RESPONSE.toString() , this , sentNotification2);
			_ls.on(LSEvent.EXTENSION_RESPONSE,this,sendExMessage);
		}
		
		private function loginNotify(msg:LSMessage):void{
			Log.debug("登陆成功，开始进入房间msg====>",JSON.stringify(msg));
			var userInfoData:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
			userInfoData.name =(msg.extendMsg as ExMSG).loginNotify.nickName || (msg.extendMsg as ExMSG).loginNotify.userName;
			userInfoData.uid = (msg.extendMsg as ExMSG).loginNotify.uid;
			this.joinRoom("001");
			
		}

		
		private function onUserEnterRoom(user:IUser,room:IRoom):void{
			Log.debug("有人进入房间");
			Log.debug("room: ",room);
			Log.debug("user: ",user);
		}
		
		private function onRoomJoin(room:Room):void{
			Log.debug("进入房间成功",room);
			sentNotification(GameNotification.GET_USER_BALANCE,true);
			//mainView.showMessage("进入房间成功"+room);
		}
		
		private function onConnectFailed():void{
			Alert.show(Light.language.getSrting("alert_msg8"), "",AlertSimplePanel,null,Handler.create(this,goBack));
		}
		
		private function onRoomJoinError(error:int):void{
			
		}
		
		private function onConnection():void{
			var appModel:AppModel = getModel(AppModel.NAME) as AppModel;
			Log.debug("链接成功 开始登陆" , appModel.uid.toString());
			//_ls.api.login("light","1231","car");
//			mainView.showMessage("链接成功 开始登陆");
//			mainView.jumpToPage(PageName.login);
		
			
			this.login(appModel.uid.toString(),appModel.token);
		}
		
		private function onLogin(m:LSMessage):void{
			Log.debug("登陆成功 开始加入房间",m);
//			mainView.showMessage("登陆成功 开始加入房间");
//			mainView.jumpToPage(PageName.joinRoom);
			var userInfoData:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
			userInfoData.name =m.content.loginResponse.userName;
			userInfoData.uid = m.content.loginResponse.userID;
		
			Log.debug("用户数据" , m.content.loginResponse.userName,"用户id:",userInfoData.uid);
		}
		
		private function onLoginError():void{
			Log.debug("登陆失败");
			Alert.show(Light.language.getSrting("alert_msg8"), "",AlertSimplePanel,null,Handler.create(this,goBack));
		}
		
		private function goBack():void{
			var ws:WebService = getModel(WebService.NAME) as WebService;
			ws.goback(Handler.create(this,this.goBackCallFunc));
		}
		
		public function goBackCallFunc():void{
			
		}
		
		public function get ls():LightClinet
		{
			return _ls;
		}
		
		public function set ls(value:LightClinet):void
		{
			_ls = value;
		}
		
		/**
		 * 
		 * @param host
		 * @param port
		 * 
		 */		
		public function connect(host:String , port:int ):void{
			_ls.connect(host , port);
		}
		
		/**
		 * 
		 * @param userName  用户名 == 平台uid
		 * @param token     平台的
		 * 
		 */		
		public function login(userName:String,token:String):void{
			
			_ls.api.login(userName , token);
			
		}
		
//		public function login(userName:String, password:String,zoneName:String = "",params:PObject = null):void{
//		
//			_ls.api.login(userName , password);
//		}
		
		public function joinRoom(id:*,pass:String = "",roomIdToLeave:int = -1,asSpect:Boolean = false):void{
			_ls.api.joinRoom(id , pass, roomIdToLeave , asSpect);
			
		}
		
		public function getRoomList(groupIds:Array = null):Array{
			return _ls.roomManager.getRoomList();
		}
		
		public function logout():void{
			_ls.api.logout();
			
			
		}
		
		
		
		/**
		 * 下注旋转的接口 
		 * @param lines    下注的线数
		 * @param bet      下注的注额
		 * 
		 */		
		public function slot(lines:int , bet:int):void{
			//var msg:MSG = _ls.proto.getMSG();
			Log.debug("SlotSocketService slot ===>" , lines,":",bet);
			var  exProto:ChinaDollsProto = _ls.exProto as ChinaDollsProto;
			
			
			var msg:ExMSG = exProto.getExMSG();
			msg.betRequest = exProto.getBettingRequest();
			msg.betRequest.betLines = lines;
			msg.betRequest.betQuota = bet;
			ls.sendExtendMessage(ExMessageID.BETTING_REQUEST , msg);
			
		}
		
		
		/**
		 * bonus 游戏的接口 
		 * @param index   选中金蛋的位置  从1 开始
		 * 
		 */		
		public function bonusRsq(index:int):void{
			Log.debug("SlotSocketService bonus=========>",index);
			var  exProto:ChinaDollsProto = _ls.exProto as ChinaDollsProto;
			
			
			var msg:ExMSG = exProto.getExMSG();
			msg.bonusRequest = exProto.getBonusRequest();
			msg.bonusRequest.betLocation = index;
			ls.sendExtendMessage(ExMessageID.BONUS_REQUEST , msg);
		}
		
		
		public function bonusEndRequest():void{
			var  exProto:ChinaDollsProto = _ls.exProto as ChinaDollsProto;
			
			
			var msg:ExMSG = exProto.getExMSG();
			msg.bonusOverRequest = exProto.getBonusOverRequest();
			ls.sendExtendMessage(ExMessageID.BONUS_OVER_REQUEST , msg);
		}
		
		/**
		 * 下注 旋转的接口返回函数
		 * @param msg  返回的信息
		 * 
		 */		
		public function betRsq(msg:LSMessage):void{
			Log.debug("自定义数据===>" ,msg); 
			if(msg.error){
				Alert.show(Light.error.getError("513"),"" ,AlertSimplePanel);
			}
			else{
				var emsg:ExMSG = msg.extendMsg as ExMSG;
				var betParam:SlotResultParam = new SlotResultParam(emsg.betResponese.gameResult,emsg.betResponese.gameResult.currentBalance,emsg.betResponese.freeGameResult,emsg.betResponese.gameResult.isBonus);
				
				sentNotification(GameNotification.SLOT_RESULT,betParam);
				
			}
			
		}
		
		public function sendExMessage(msg:LSMessage):void{
			Log.debug("SlotSocketService sendExMessage==============>");
			sentNotification(msg.msgId.toString(),msg);
		}
		
		
		public function bringMoney(amount:int):void{
			Log.debug("SlotSocketService bringMoney========>",amount);
			var  exProto:ChinaDollsProto = _ls.exProto as ChinaDollsProto;
			
			
			var msg:ExMSG = exProto.getExMSG();
			msg.bringMoneyRequest = exProto.getBringMoneyRequest();
			msg.bringMoneyRequest.amount = Math.round(amount);
		
			
			ls.sendExtendMessage(ExMessageID.BRING_MONEY_REQUEST , msg);
			
		
		}
		
		public function bringMoneyRsp(msg:LSMessage):void{
			Log.debug("SlotSocketService bringMoneyRsp======>");
			if(msg.error){
				Alert.show(Light.error.getError("513"),"" ,AlertSimplePanel);
			}
			else{
				var m:ExMSG = msg.extendMsg as ExMSG;
				var udata:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
				udata.balance = m.bringMoneyResponse.amount;
				Log.debug("SlotSocketService bringMoneyRsp======>",udata.balance);
				sentNotification(GameNotification.SLOT_UPDATE_UI,udata);
			}
		
		}
		
		
		
		
		
		
		public function onConnectRetry():void{
			Light.layer.loadingMask.lock(ConstData.ROOM_RECONNECT_MASK);
		}
		
		public function onDisConnect():void{
			trace("SlotSocketService onDisconnect===========>");
			//Light.layer.loadingMask.lock(ConstData.ROOM_RECONNECT_MASK);
			if(!this._kickoffUser){
				Alert.show(Light.language.getSrting("duanxian"), "",AlertSimplePanel,null,Handler.create(this,function(){
					var ws:WebService = getModel(WebService.NAME) as WebService;
					ws.goback(Handler.create(this, this.goBackCallFunc));
				}));
			}
			
			
			//sentNotification(GameNotification.SLOT_DISCONNECT);
		}
		
		public function  onConnectResume():void{
			Light.layer.loadingMask.unLock(ConstData.ROOM_RECONNECT_MASK);
			
		}
		
		public function onClose():void{
			trace("SlotSocketService onClose===========>");
			Light.layer.loadingMask.unLock(ConstData.ROOM_RECONNECT_MASK);
		}
		
		
		public function slotTest(lines:int , bet:int,arr:Array):void{
			//var msg:MSG = _ls.proto.getMSG();
			Log.debug("SlotSocketService slotTest ===>" , lines,":",bet);
			var  exProto:ChinaDollsProto = _ls.exProto as ChinaDollsProto;
			
			
			var msg:ExMSG = exProto.getExMSG();
			msg.testBetRequest = exProto.getTestBettingRequest();
			msg.testBetRequest.betLines = lines;
			msg.testBetRequest.betQuota = bet;
			msg.testBetRequest.finalResult = arr;
			ls.sendExtendMessage(ExMessageID.TEST_BETTING_REQUEST , msg);
			
		}
	}
}