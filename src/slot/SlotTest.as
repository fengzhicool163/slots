package slot
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.parrerns.Command;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.events.GameEvent;
	
	import laya.events.Event;
	import laya.maths.Point;
	
	import view.slot.Room;
	import view.slot.SetResult;

	public class SlotTest extends Command implements ICommand
	{
		private static var _ins:SlotTest;
		private var _slot:Room;
		private var _start:Number;
		private var _context:*
		public function SlotTest()
		{
		}
		
		public static function getInstance():SlotTest{
			if(!SlotTest._ins){
				SlotTest._ins = new SlotTest();
			}
			return SlotTest._ins;
		}
		
		public function init(slot:Room,context:*):void{
			this._slot = slot;
			this._context = context;
			this._slot.testsprite.on(Event.MOUSE_DOWN , this , onMouseClick);
			this._slot.testsprite.on(Event.MOUSE_UP , this , onMouseUp);	
			
		}
		
		public function onMouseUp():void{
			if((Laya.stage.mouseY - this._start)>150){
				var layer:SetResult = new SetResult();
				this._slot.addChild(layer);
			}
		}
		
		public function onMouseClick():void{
			this._start = Laya.stage.mouseY;
		}
		
		public function onSlot(param:Array):void{
			this._context.startTest();
			this._context.sentNotification(GameNotification.SLOT_TEST , param);
		}
	}
}