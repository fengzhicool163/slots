package chinadolls.service
{
	import com.kgame.KGH5;
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.parrerns.Model;
	import com.lightUI.logging.Log;
	import com.lightUI.logging.LogLevel;
	
	import chinadolls.model.AppModel;
	import chinadolls.model.data.HallData;
	import chinadolls.model.param.WebParam;
	import chinadolls.model.vo.SlotConfigData;
	
	import laya.utils.Browser;
	import laya.utils.Handler;

	/**
	 * 这里处理web http相关的通信 包括初始化页面传过来的数据 
	 * @author light-k
	 * "ip":"10.112.12.56",
	 */	
	public class WebService extends Model implements IModel
	{
		
		public var webApi:KGH5 = new KGH5();
		public static var NAME:String = "webService";
		
		public var appModel:AppModel;
		
		public function WebService(modelName:String=null, data:Object=null)
		{
			super(modelName, data);
		}
		
	   	override public  function getInjector():Array{
			return [AppModel.NAME];
		} 
		
		public function getUserBalance(callback:Handler):void
		{
			if(appModel.isLocal){
					var param:Object = new Object();
					param.info = new Object();
					param.info.cash = 10000;
					param.info.coin = 22323;
					param.info.nm = 22323;
					callback.method.apply(callback.caller,[param]);
					
			}else{
				webApi.getUserBalance(callback);
			}
		}
		
		public function resolveBrowserParam():WebParam{
			var browserStr:String = Browser.document.location.href.toString();
			var askIndex:int = browserStr.indexOf("?");
			var paramAry:Array = browserStr.substr(askIndex+1).split("&");
			var param:WebParam = new WebParam();
			for (var i:int=0;i<paramAry.length;i++){
				var ary:Array = paramAry[i].split("=");
				var key:String = ary[0];
				var value:String = ary[1];
				param[key] = value;
				trace("key: "+key+",  value: "+value);
			}
			//調試數據
			if(!param.uid){
				
				// saboo -> 1009521  6cdbbbaa3f6806a7e131263a0999d63d
				// tim -> 1014452  9d5566c2bc64508ecaf5579270d4bf75
				param.uid = 1073723;//1003358;//1014452;//1014495;
				param.access_token = "4642723077470ed7d3d0a4e3b58acc25";
				appModel.isLocal= true;
			}
			if(param.isDebug){
				Log.getLogger().isDebug = (param.isDebug == "true");
			}
			var configData:SlotConfigData = getSingleton(SlotConfigData.NAME) as SlotConfigData;
			Log.getLogger().loggingLevel = LogLevel.DEBUG;
			Log.getLogger().isDebug = configData.debug;
			
			Log.debug("uid ",param.uid," token: ",param.access_token);
			return param;
		}
		
		/**
		 * 跳充值页面
		 */
		public function recharge(moneyType:String, callback:Handler):void{
			webApi.rechargeShow(moneyType,callback)
		}
		
		/**
		 * 返回大厅
		 */
		public function goback(callback:Handler):void{
			webApi.goBack(callback)
		}
		
		
		public function getUsersInfo(callback:Handler):void{
			//webApi.getPlayerInfo(users,callback);
			
				webApi.getSelfInfo(callback);
			  
		}
		
	}
}