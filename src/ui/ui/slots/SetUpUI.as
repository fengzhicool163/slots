/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.slots {
	import laya.ui.*;
	import laya.display.*; 

	public class SetUpUI extends View {
		public var music:Button;
		public var rule:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":100,"height":250},"child":[{"type":"Image","props":{"y":8,"x":8,"skin":"slots/frame_systembig.png"}},{"type":"Image","props":{"y":75,"x":14,"skin":"slots/frame_setup.png"}},{"type":"Image","props":{"y":166,"x":14,"skin":"slots/frame_rule.png"}},{"type":"Button","props":{"y":83,"x":23,"var":"music","stateNum":1,"skin":"slots/setup.png"}},{"type":"Button","props":{"y":174,"x":23,"var":"rule","stateNum":1,"skin":"slots/rule.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}