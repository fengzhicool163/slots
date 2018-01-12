package chinadolls.command
{
	import com.aaron.ls.v2.bitswarm.LSMessage;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInPanel;
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	import com.lightUI.manager.scence.ScenceInfo;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.model.param.BigWinParam;
	import chinadolls.proto.ExMessageID;
	
	import view.slot.BigWin;
	import view.slot.Bonus;
	import view.slot.Room;
	
	public class BigWinCommand extends Command implements ICommand
	{
		public function BigWinCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			Log.debug("BetCommand ",notification.getBody())
			if(notification.getName() == GameNotification.SLOT_BIG_WIN){
				//showBigWin();
				var param:BigWinParam = notification.getBody() as BigWinParam;
				show(param);
			}
		}
		
		public function showBigWin():void{
			Log.debug("BigWinCommand Show===============>");
			Light.scence.addScence("bigwin",[BigWin],null,ScenceInfo.KEPT_PERSCENCE)
			
			Light.scence.creat();
		}
		
		public function show(param:BigWinParam):void{
			sentNotification(GameNotification.SLOT_SHOW_BIG_WIN_PANEL , param);
		}
		
	}
}