package chinadolls.model
{
	import com.aaron.ls.v2.proto.LProto;
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.parrerns.Model;
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.proto.ChinaDollsProto;
	
	import conf.conf_game;
	
	import laya.utils.Handler;
	
	import msg.msg_cs;
	
			
			
	public class GameProtoModel extends Model implements IModel
	{
		public static const NAME:String = "gameProtoModel";
		
		public var proto:LProto;
		public var exProto:ChinaDollsProto;
		
//		public var msg_proto:msg_cs;
//		public var conf_proto:conf_game;
		
		private var _callBack:Handler;
		
		public function GameProtoModel(modelName:String=null, data:Object=null)
		{
			super(modelName, data);
			
			
			
			proto = new LProto();
			exProto = new ChinaDollsProto();
		}
		
		public function loadProtoFile(callBack:Handler):void{
			Log.debug("msg_proto",this.proto,this.exProto,this)
			_callBack = callBack;
			proto.loadProtoFile(Light.loader.URLM.getURL("proto"));
			exProto.loadProtoFile(Light.loader.URLM.getURL("exProto"));
			
			_callBack.run();
			sentNotification(GameNotification.PROTO_CREAT);
		}
	}
}