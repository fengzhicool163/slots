package chinadolls.consts
{
	public class GameNotification
	{
		public static const STARTUP:String  = "startup";
		
		public static const PROTO_CREAT:String = "protoCreat";
		
		public static const HALL_SOCKET_CONNECT:String = "hallSocketConnect";/////////////连接大厅服务器
		public static const HALL_SOCKET_CONNECT_COMPLETE:String = "hallSocketConnectComplete";//////////////连接大厅成功
		public static const HALL_SOCKET_CONNECT_FAILED:String = "hallSocketConnectFailed";//////////////////连接大厅失败
		
		public static const SOCKET_CONNECT:String = "socketConnect";////////////////通知连接服务器 
		public static const ONLOGIN:String = "onLogin";/////////////////////////////登录成功   发送房间列表
		public static const START_ROOM_LIST:String = "startRoomList";///////////////开始请求房间列表
		
		public static const JOIN_ROOM_RQS:String = "joinRoomRqs";///////////////////请求加入房间
		public static const JOIN_ROOM_RSP:String = "joinRoomRsp";
		public static const ENTER_ROOM:String = "enterRoom";//////////////////////////加入房间   打开房间窗体
		public static const LOAD_DATA_MESSAGE:String= "loadDataMessage";//////////////////////////加载进度事件
		public static const SHOW_CARRY_IN_PANEL:String ="showCarryInPanel";//////////////////////////显示带入面板事件
		public static const SHOW_ALERT_PANEL:String ="showAlertPanel";//////////////////////////显示提示面板事件
		public static const GET_USER_BALANCE:String ="getUserBalance";//////////////////////////获取用户余额信息
		public static const ROUND_COMMIT_RSP:String="roundCommitRsp";/////////////////////////确认局下注返回消息
		public static const ROUND_SETTLEMENT_RSP:String="roundSettlementRsp";
		public static const HALL_HEART_BEAT:String = "hallHeartBeat";
		public static const ROOM_HEART_BEAT:String = "roomHeartBeat";
		public static const SCENCE_CHANGE:String = "car.SCENCE_CHANGE"; //切换场景，主要是用于大厅和游戏场景切换
		public static const Leave_Game:String = "car.Leave_Game"; //离开游戏
		
		public static const TESTMAIN:String = "TestMain";
		
		public static const PRELOAD:String = "PreLoad";
		
		public static  const START_SLOT:String = "StartSlot";  //点击摇奖按钮，摇奖事件
		
		public static const SLOT_RESULT:String = "SlotResult";  // 有了摇奖结果的事件
		
		public static const CARRAY_IN_MONEY:String = "CarrayInMoney" ;  //带入资金事件
		public static const CARRAY_IN_MONEY_RSP:String = "CarrayInMoneyRsp";   // 带入资金返回的事件
		
		public static const SLOT_UPDATE_UI:String = "SlotUpdateUI";     // 更新ui事件
		
		public static const GET_USER_INFO:String = "GetUserInfo";
		
		public static const SHOW_USER_NAME:String = "ShowUserName";
		
		public static const SLOT_COMPLETE_REWARD:String = "SlotCompleteReward";
		
		public static const SLOT_FREE_GAME:String = "SlotFreeGame";
		
		public static const SLOT_VISIBLE:String  = "SlotVisible";
		
		public static const SLOT_SHOW_BONUS:String = "SlotShowBonus";
		
		public static const SLOT_BONUS:String = "SlotBonus";
		public static const SLOT_BONUS_RESULT:String = "SlotBonusResult";
		public static const SLOT_BONUS_END:String = "SlotBonusEnd";
		
		
		public static const SLOT_BIG_WIN:String = "slotBigWin";
		public static const SLOT_SHOW_BIG_WIN_PANEL:String = "slotShowBigWinPanel";
		
		public static const SLOT_STOP_BTN_GRAY:String = "SlotStopBtnGray";
		
		public static const SLOT_TEST:String = "SlotTest";
		
		public static const SLOT_DISCONNECT:String = "SlotDisconnect";
		
		public static const SLOT_RESUME_ALL_BTN:String = "SlotResumeAllBtn";
	}
}