/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.slots {
	import laya.ui.*;
	import laya.display.*; 

	public class AnimBoxUI extends View {
		public var effects_ani06:Animation;
		public var effects_ani01:Animation;
		public var effects_ani07:Animation;
		public var effects_ani08:Animation;
		public var effects_ani09:Animation;
		public var effects_ani010:Animation;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"y":0,"x":0,"width":300,"height":300},"child":[{"type":"Animation","props":{"y":150,"x":150,"visible":false,"var":"effects_ani06","source":"ui/slots/effects_ani06.ani"}},{"type":"Animation","props":{"y":150,"x":150,"visible":false,"var":"effects_ani01","source":"ui/slots/effects_ani01.ani"}},{"type":"Animation","props":{"y":149,"x":154,"visible":false,"var":"effects_ani07","source":"ui/slots/effects_ani07.ani"}},{"type":"Animation","props":{"y":149,"x":154,"visible":false,"var":"effects_ani08","source":"ui/slots/effects_ani08.ani"}},{"type":"Animation","props":{"y":149,"x":154,"visible":false,"var":"effects_ani09","source":"ui/slots/effects_ani09.ani"}},{"type":"Animation","props":{"y":149,"x":154,"visible":false,"var":"effects_ani010","source":"ui/slots/effects_ani010.ani"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}