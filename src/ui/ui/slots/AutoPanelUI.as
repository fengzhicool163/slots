/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.slots {
	import laya.ui.*;
	import laya.display.*; 

	public class AutoPanelUI extends View {
		public var btn_10:Button;
		public var btn_25:Button;
		public var btn_50:Button;
		public var btn_99:Button;
		public var btn_till:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":110,"height":550},"child":[{"type":"Image","props":{"y":14,"x":5,"skin":"slots/frame_autobig.png"}},{"type":"Button","props":{"y":306,"x":12,"var":"btn_10","stateNum":1,"skin":"slots/spin10.png"}},{"type":"Button","props":{"y":213,"x":12,"var":"btn_25","stateNum":1,"skin":"slots/spin25.png"}},{"type":"Button","props":{"y":117,"x":12,"var":"btn_50","stateNum":1,"skin":"slots/spin50.png"}},{"type":"Button","props":{"y":21,"x":12,"var":"btn_99","stateNum":1,"skin":"slots/spin99.png"}},{"type":"Button","props":{"y":402,"x":12,"var":"btn_till","stateNum":1,"skin":"slots/untill.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}