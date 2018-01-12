package chinadolls.service
{
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.parrerns.Model;
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInPanel;
	import com.lightUI.core.Light;
	import com.lightUI.events.LightEvent;
	import com.lightUI.events.ScenceManagerEvent;
	import com.lightUI.logging.Log;
	import com.lightUI.manager.scence.ScenceInfo;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.mediator.TipsLoadMediator;
	import chinadolls.model.AppModel;
	import chinadolls.model.GameProtoModel;
	import chinadolls.model.MySoundManager;
	import chinadolls.model.data.ConstData;
	import chinadolls.model.data.UserInfoData;
	import chinadolls.model.param.WebParam;
	import chinadolls.model.vo.SlotConfigData;
	import chinadolls.service.SlotSocketService;
	import chinadolls.util.LocalConfig;
	
	import laya.display.BitmapFont;
	import laya.display.Text;
	import laya.net.Loader;
	import laya.utils.Handler;
	
	import view.alert.MusicSetPanel;
	import view.alert.RulePanel;
	import view.slot.BigWin;
	import view.slot.Bonus;
	import view.slot.Room;
	import view.slot.Transitions;
	import view.smallLoading.SmallLoading;
	import view.tipsLoad.TipsLoadPanel;
	
	
	public class PreLoadService extends Model implements IModel
	{
		public static const NAME:String = "preLoadService";
		public function PreLoadService(proxyName:String=null)
		{
			proxyName = proxyName?proxyName:NAME;
			super(proxyName);
			
			
		}
		
		private var _configURL:String = "res/config/config.json";
		
		public function startup():void{
			//加载配置文件
			Log.debug("加载配置文件");
			loadConfig();
		}
		
		private function loadConfig():void{
			Light.loader.load([{url:_configURL,type:Loader.JSON}],Handler.create(this,onConfigLoaded));
		}
		private function onConfigLoaded():void{
			//加载url配置文件
			Log.debug("加载url配置文件");
			
			var cowboyConfigData:SlotConfigData = getSingleton(SlotConfigData.NAME) as SlotConfigData;
			cowboyConfigData.configData = Light.loader.getRes(_configURL);
			
//			var load:SlotSocketService = getModel(SlotSocketService.NAME) as SlotSocketService;
//			
//			
//			load.getSetting(cowboyConfigData.configData);
			
			loadURLConfig();
		}
		
		private function loadURLConfig():void{
			Light.loader.URLM.addEventListener(LightEvent.COMPLETE,this, onConfigURLLoaded);
			Light.loader.URLM.configURL = "res/config/GameURL.json";
			Light.loader.URLM.loadConfig();
		}
		private function onConfigURLLoaded(e:LightEvent):void{
			Light.scence.init(Light.loader.URLM.config.scence);
			//加载smallLoading
			loadSmallLoading();
		}
		
		private function loadSmallLoading():void{
			
			
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_PROGRESS,this, onProgress,["smallLoading"]);
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_COMPLETE,this, onComplate,["smallLoading"]);
			
			Light.scence.addScence("smallLoading",[SmallLoading],Light.layer.top);
			Light.scence.creat();
		}
		
		private function loadTipLoad():void
		{
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_PROGRESS,this, onProgress,["tipsLoadPanel"]);
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_COMPLETE,this, onComplate,["tipsLoadPanel"]);
			Light.scence.addScence("tipsLoadPanel",[TipsLoadPanel],Light.layer.top);
				//.regView("TipsLoadPanel",TipsLoadPanel);
			Light.scence.creat();
		}
		
		private function loadGameConfig():void{
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_PROGRESS,this, onProgress,["config"]);
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_COMPLETE,this, onComplate,["config"]);
			
			Light.scence.addScence("config",[],null,ScenceInfo.KEPT_PERSCENCE);
			Light.scence.creat();
			
			//初始化
			initWebParam();
			initCookies();
			initPlayBgMusic();
		}
		
		private function initWebParam():void{
			var webService:WebService = getModel(WebService.NAME) as WebService;
			var webParam:WebParam = webService.resolveBrowserParam();
			var appModel:AppModel = getModel(AppModel.NAME) as AppModel;
			appModel.uid = webParam.uid;
			appModel.token = webParam.access_token;
			sentNotification(GameNotification.GET_USER_INFO);
		}
		
		private function initCookies():void{
			var appModel:AppModel = getModel(AppModel.NAME) as AppModel;
			var mySoundManager:MySoundManager = getModel(MySoundManager.NAME) as MySoundManager;
			mySoundManager.musicSessionName = AppModel.APP_NAME + appModel.uid;
		}
		
		private function initPlayBgMusic():void{
			
			var bgMusicNameArr:Array = new Array();
			for(var i:int = 0; i < 1; i++)
			{
				bgMusicNameArr.push("BgSound_" + i.toString());
			}
			MySoundManager.getInstance().playBgMusic(bgMusicNameArr);
		}
		
		private function laodCommon():void
		{
			var betAmount:BitmapFont = new BitmapFont();
			betAmount.loadFont("BitmapFont/bnt.fnt",Handler.create(this,function(f:BitmapFont):void{
				Text.registerBitmapFont("bnt", f);
			},[betAmount]));
			var numw:BitmapFont = new BitmapFont();
			numw.loadFont("BitmapFont/numw.fnt",Handler.create(this,function(f:BitmapFont):void{
				Text.registerBitmapFont("numw", f);
			},[numw]));
			var freefont:BitmapFont = new BitmapFont();
			freefont.loadFont("BitmapFont/freefont.fnt",Handler.create(this,function(f:BitmapFont):void{
				Text.registerBitmapFont("freefont", f);
			},[freefont]));
			var big:BitmapFont = new BitmapFont();
			big.loadFont("BitmapFont/big.fnt",Handler.create(this,function(f:BitmapFont):void{
				Text.registerBitmapFont("big", f);
			},[big]));
			
			var line:BitmapFont = new BitmapFont();
			line.loadFont("BitmapFont/line.fnt",Handler.create(this,function(f:BitmapFont):void{
				Text.registerBitmapFont("line", f);
			},[line]));
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_PROGRESS,this, onProgress,["common"]);
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_COMPLETE,this, onComplate,["common"]);
			
			Light.scence.addScence("common",[MusicSetPanel,RulePanel,BigWin],null,ScenceInfo.KEPT_PERSCENCE)
				
			Light.scence.creat();
		}
		
		public function loadRoom():void{
//			var appModel:AppModel = getModel(AppModel.NAME) as AppModel;
//			appModel.states = ConstData.HALL_STATE;
			//sentNotification(GameNotification.SCENCE_CHANGE, GameNotification.Scene_Hall);
			if( Light.scence.getScenceInfo("room") == null )
			{
				sentNotification(TipsLoadMediator.SHOW_PANEL);
			}
			
			
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_PROGRESS,this, onProgress,["room"]);
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_COMPLETE,this, onComplate,["room"]);
			//			}
			Light.scence.addScence("room",[view.slot.Room,AssetsInPanel,Bonus,Transitions],Light.layer.scence,ScenceInfo.HIDE_PERSCENCE)
		
			Light.scence.creat();
			
		}
		
//		public function loadRoom():void{
//			var appModel:AppModel = getModel(AppModel.NAME) as AppModel;
//			appModel.states = ConstData.ROOM_STATE;
//			sentNotification(GameNotification.SCENCE_CHANGE, GameNotification.Scene_Game);
//			if( Light.scence.getScenceInfo("room") == null )
//			{
//				Light.scence.removeScence("hall");
//				sentNotification(TipsLoadMediator.SHOW_PANEL);
//			}
////			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_PROGRESS,this, onProgress,["room"]);
////			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_COMPLETE,this, onComplate,["room"]);
////			Light.scence.addScence("room",["Room","TrendPokerView"],Light.layer.scence,ScenceInfo.HIDE_PERSCENCE)
////							.regView("Room",Room).regView("TrendPokerView",TrendPokerView);
////							
////			Light.scence.creat();
//		}
		
		private function loadProto():void{
			Log.debug("loadProto")
			var gameProto:GameProtoModel = getModel(GameProtoModel.NAME) as GameProtoModel;
			gameProto.loadProtoFile(new Handler(this,protoLoaded));
		}
		private function protoLoaded():void{
			Log.debug("protoLoaded");
			
			var gameProto:GameProtoModel = getModel(GameProtoModel.NAME) as GameProtoModel;
			var cowboyConfigData:SlotConfigData = getSingleton(SlotConfigData.NAME) as SlotConfigData
			var socketService:SlotSocketService = getModel(SlotSocketService.NAME) as SlotSocketService;
			socketService.initSlotSocket(gameProto.proto,gameProto.exProto,cowboyConfigData.configData);
			
			
			loadRoom();
		}
		
		private function onProgress(scenceName:String,e:ScenceManagerEvent):void{
			switch(scenceName)
			{
				case "common":
				case "hall":
					sentNotification(GameNotification.LOAD_DATA_MESSAGE, {"scenceName":scenceName, "value":e.data, "total":2});
					break;
				case "room":
					sentNotification(GameNotification.LOAD_DATA_MESSAGE, {"scenceName":scenceName, "value":e.data, "total":1});
					break;
			}
		}
		private function onComplate(scenceName:String,e:ScenceManagerEvent):void{
			Log.debug("onComplate 切换了场景",e.data)
			Light.scence.removeEventListener(ScenceManagerEvent.SCENCE_PROGRESS,this, onProgress);
			Light.scence.removeEventListener(ScenceManagerEvent.SCENCE_COMPLETE,this,onComplate);
			var appModel:AppModel = getModel(AppModel.NAME) as AppModel;
			
			switch(scenceName)
			{
				case "smallLoading":
					loadTipLoad();
					break;
				case "tipsLoadPanel":
					Log.debug("tipsLoadPanel");
					Light.layer.loadingMask.clear();
					loadGameConfig();
					break;
				
				case "config":
					Light.error.init(Light.loader.getRes("error_code"));
					Light.language.init(Light.loader.getRes("language"));
					//Light.roomName.init(Light.loader.getRes("roomName"));
					LocalConfig.getInstance().lines = Light.loader.getRes("lines");
					LocalConfig.getInstance().betLevel = Light.loader.getRes("betlevel");
					Light.scence.removeScence("config");
					laodCommon();
					break;
				case "common":
					Light.scence.removeScence("common");
					loadProto();
					break;
				case "room":
					Log.debug("sentNotification",GameNotification.HALL_SOCKET_CONNECT);
					appModel.states = ConstData.HALL_STATE;
					sentNotification(GameNotification.HALL_SOCKET_CONNECT);
					
					var udata:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
					sentNotification(GameNotification.SHOW_USER_NAME,udata);
					break;
			
//				case "room":
//					Log.debug("进入游戏房间");
//					sentNotification(TipsLoadMediator.HIDE_PANEL);
//					sentNotification(GameNotification.ROOM_SOCKET_CONNECT);
//					break;
				default:
					break;
			}
		}
		
//		private function configGame():void{
//			
//			Light.error.init(Light.loader.getRes("error_code"));
//			Light.language.init(Light.loader.getRes("language"));
//			
//			var socketService:SlotSocketService = getModel(SlotSocketService.NAME) as SlotSocketService;
//			socketService.initSlotSocket();
//			
//			Light.scence.removeScence("config");
//			laodCommon();
//		}
	}
}


