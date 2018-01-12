package chinadolls
{
	import com.lightMVC.parrerns.Configure;
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInPanel;
	import chinadolls.command.BetCommand;
	import chinadolls.command.BigWinCommand;
	import chinadolls.command.BonusCommand;
	import chinadolls.command.CarryInCommand;
	import chinadolls.command.PreLoadCommand;
	import chinadolls.command.SlotFreeGameCommand;
	import chinadolls.command.SlotGameConnectCommand;
	import chinadolls.command.TestMainCommand;
	import chinadolls.command.UserBalanceCommand;
	import chinadolls.consts.GameNotification;
	import chinadolls.mediator.AlertMediator;
	import chinadolls.mediator.AssetInMediator;
	import chinadolls.mediator.BigWinMediator;
	import chinadolls.mediator.BonusMediator;
	import chinadolls.mediator.MusicSetMediator;
	import chinadolls.mediator.RoomMediator;
	import chinadolls.mediator.RuleMediator;
	import chinadolls.mediator.SmallLoadingMediator;
	import chinadolls.mediator.TipsLoadMediator;
	import chinadolls.mediator.TransitionsMediator;
	import chinadolls.model.AppModel;
	import chinadolls.model.GameProtoModel;
	import chinadolls.model.MySoundManager;
	import chinadolls.model.data.RoomData;
	import chinadolls.model.data.UserInfoData;
	import chinadolls.model.vo.SlotConfigData;
	import chinadolls.proto.ExMessageID;
	import chinadolls.service.PreLoadService;
	import chinadolls.service.SharedObjectService;
	import chinadolls.service.SlotSocketService;
	import chinadolls.service.WebService;
	
	import slot.SlotMain;
	import slot.SlotTest;
	
	import view.alert.AlertPanel;
	import view.alert.MusicSetPanel;
	import view.alert.RulePanel;
	import view.slot.BigWin;
	import view.slot.Bonus;
	import view.slot.Room;
	import view.slot.Transitions;
	import view.smallLoading.SmallLoading;
	import view.tipsLoad.TipsLoadPanel;
	
	public class SlotConfigure extends Configure
	{
		public function SlotConfigure()
		{
			super();
		}
		
		override public function configure():void{
			initCommand();
			initModel();
			initMediator();
			
		}
		
		private function initCommand():void{
			registerCommand(GameNotification.PRELOAD , PreLoadCommand);
			registerCommand(GameNotification.HALL_SOCKET_CONNECT,SlotGameConnectCommand);
			registerCommand(GameNotification.START_SLOT,BetCommand);
			registerCommand(GameNotification.TESTMAIN , TestMainCommand);
			//registerCommand(GameNotification.SLOT_RESULT ,SlotMain);
			registerCommand(GameNotification.SLOT_FREE_GAME ,SlotFreeGameCommand);
			registerCommand(GameNotification.SLOT_TEST,BetCommand);
			registerCommand(GameNotification.SLOT_RESULT ,SlotTest);
			registerCommand(ExMessageID.BETTING_REQUEST.toString(),BetCommand);
			registerCommand(ExMessageID.BETTING_RESPONSE.toString(),BetCommand);
			
			registerCommand(ExMessageID.LOGIN_SIGNIN_KICK.toString(),BetCommand);
			registerCommand(ExMessageID.SHUTDOWN_SERVER.toString(),BetCommand);
			
			registerCommand(ExMessageID.TEST_BETTING_REQUEST.toString(),BetCommand);
			registerCommand(ExMessageID.TEST_BETTING_RESPONSE.toString(),BetCommand);
			
//			registerCommand(ENCSType.CS_TYPE_ROUND_SUM_BETS_NOTIFY.toString(),BetCommand);
			
			registerCommand(ExMessageID.BONUS_RESPONSE.toString(),BonusCommand);
			registerCommand(GameNotification.SLOT_BONUS, BonusCommand);
			registerCommand(GameNotification.SLOT_BONUS_END, BonusCommand);
			
			
			registerCommand(GameNotification.GET_USER_BALANCE, UserBalanceCommand);
			registerCommand(GameNotification.GET_USER_INFO, UserBalanceCommand);
			registerCommand(GameNotification.CARRAY_IN_MONEY , CarryInCommand);
			registerCommand(ExMessageID.BRING_MONEY_RESPONSE.toString() , CarryInCommand);

			
			registerCommand(GameNotification.SLOT_BIG_WIN, BigWinCommand);
		}
		
		private function initModel():void{
			asSingleton(SlotConfigData.NAME,SlotConfigData);
			asSingleton(UserInfoData.NAME,UserInfoData);
			registerModel(new PreLoadService(PreLoadService.NAME));
			
			registerModel(new GameProtoModel(GameProtoModel.NAME));
			registerModel(new WebService(WebService.NAME));
			registerModel(new AppModel(AppModel.NAME));
			registerModel(new SlotSocketService(SlotSocketService.NAME));
			registerModel(new chinadolls.service.SharedObjectService(SharedObjectService.NAME));
			registerModel(new MySoundManager(MySoundManager.NAME));
			
			//asSingleton(SlotConfigData.NAME,SlotConfigData);
			asSingleton(RoomData.NAME, RoomData);
			//asSingleton(HallData.NAME,HallData);
			
		}
		
		private function initMediator():void{
			registerMediator(new SmallLoadingMediator(SmallLoadingMediator.NAME),SmallLoading);
			registerMediator(new TipsLoadMediator(TipsLoadMediator.NAME), TipsLoadPanel);
			//registerMediator(new HallMediator(HallMediator.NAME),Hall);
			
			registerMediator(new AssetInMediator(AssetInMediator.NAME),AssetsInPanel);
			registerMediator(new AlertMediator(AlertMediator.NAME),AlertPanel);
			registerMediator(new RoomMediator(RoomMediator.NAME),Room);
			registerMediator(new BonusMediator(BonusMediator.NAME),Bonus);
			registerMediator(new RuleMediator(RuleMediator.NAME),RulePanel);
			registerMediator(new MusicSetMediator(MusicSetMediator.NAME),MusicSetPanel);
			registerMediator(new BigWinMediator(BigWinMediator.NAME),BigWin);
			registerMediator(new TransitionsMediator(TransitionsMediator.NAME),Transitions);
			
			registerMediator(new SlotMain(SlotMain.NAME),null);
//			registerMediator(new TrendPokerMediator(TrendPokerMediator.NAME),TrendPokerView);
		}
		
		private function startup():void{
			
		}
	}
}