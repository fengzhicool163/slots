/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class WaitingPanelUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":831,"height":110},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"alert/img_hint_1.png"}},{"type":"Image","props":{"y":38,"x":212,"skin":"room/playing.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}