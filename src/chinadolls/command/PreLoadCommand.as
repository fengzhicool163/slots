package chinadolls.command
{
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	
	import chinadolls.service.PreLoadService;
	
	public class PreLoadCommand extends Command
	{
		public function PreLoadCommand()
		{
			super();
		}
		
		 public override function handler(notification:INotification):void
		{
			 var load:PreLoadService = getModel(PreLoadService.NAME) as PreLoadService;
			 load.startup();
		}
	}
}