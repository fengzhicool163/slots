//  socket  鏈接命令
package chinadolls.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.model.vo.SlotConfigData;
	import chinadolls.service.SlotSocketService;
	
	import com.lightUI.logging.Log;
	public class SlotGameConnectCommand extends Command implements ICommand
	{		
		
		public function SlotGameConnectCommand()
		{
			super();
		}
		
		override public function getInjector():Array{
			return [];
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == GameNotification.HALL_SOCKET_CONNECT){
				hallConnectHandler();
			}
			else if(notification.getName() == GameNotification.START_SLOT){
				startSlot();	
			}
		}
		/**
		 *  加载完成 准备链接服务器 
		 * 
		 */		
		private function hallConnectHandler():void{
			var config:SlotConfigData = getSingleton(SlotConfigData.NAME) as SlotConfigData;
			var hallSocketService:SlotSocketService = getModel(SlotSocketService.NAME) as SlotSocketService;
			hallSocketService.connect(config.ip,config.port);
		}
		
		/**
		 * 开始摇奖的处理函数 
		 * 
		 */		
		private function startSlot():void{
			Log.debug("SlotGameCommand startSlot=====>");
			var hallSocketService:SlotSocketService = getModel(SlotSocketService.NAME) as SlotSocketService;
			hallSocketService.slot(5,2);
		}
		
	}
}