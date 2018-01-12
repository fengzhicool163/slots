package view.alert
{
	import com.lightUI.components.alert.IAlertWindow;
	import com.lightUI.events.WindowEvent;
	
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.ui.Button;
	
	import ui.ui.alert.AlertPanelUI;
	
	public class AlertPanel extends AlertPanelUI implements IAlertWindow
	{
		private var _data:Object;
		
		public function AlertPanel()
		{
			super();
			init();
		}
		
		private function init():void{
			var l:int = this.numChildren;
			var child:Sprite;
			
			for (var i:int = 0; i < l; i++) 
			{
				child = this.getChildAt(i) as Sprite;
				
				if(this.getChildAt(i) is Button){
					child.on(Event.MOUSE_DOWN,this,onClick);
				}
			}
		}
		
		private function onClick(e:Event):void{
			this.event(WindowEvent.CLOSE,e.target.name);
		}
		
		public function set title(value:String):void{
		
		}
		
		public function set msg(value:String):void{
			txt_label.text = value;
		}
		
		public function set data(value:Object):void{
			_data = value;
		}
		
		public function get data():Object{
			return _data;
		}
	}
}