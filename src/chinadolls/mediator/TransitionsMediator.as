package chinadolls.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.parrerns.Mediator;
	
	import chinadolls.consts.GameNotification;
	
	import slot.SlotTransitions;
	
	import view.slot.Transitions;
	
	public class TransitionsMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "transitionMediator";
		public function TransitionsMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function setViewComponent(viewComponent:Object):void{
			super.setViewComponent(viewComponent);
			SlotTransitions.getInstance().init(viewComponent as Transitions);
			
		}
	}
}