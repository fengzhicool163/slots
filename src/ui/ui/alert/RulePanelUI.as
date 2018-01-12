/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.alert {
	import laya.ui.*;
	import laya.display.*; 

	public class RulePanelUI extends Dialog {
		public var rule2:Image;
		public var rule1:Image;
		public var rule0:Image;
		public var rule3:Image;
		public var btnClose:Button;
		public var btn_previous:Button;
		public var btn_next:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":1094,"visible":true,"repeatY":2,"height":600},"child":[{"type":"Image","props":{"y":-20,"x":0,"skin":"slots/help_panel.png"}},{"type":"Image","props":{"y":-19,"x":74,"var":"rule2","skin":"slots/help_01.png"}},{"type":"Image","props":{"y":53,"x":80,"var":"rule1","skin":"slots/help_02.png"}},{"type":"Image","props":{"y":53,"x":74,"var":"rule0","skin":"slots/help_03.png"}},{"type":"Image","props":{"y":20,"x":26,"width":1041,"var":"rule3","skin":"slots/help_04.png","height":544}},{"type":"Button","props":{"y":545,"x":468,"var":"btnClose","stateNum":1,"skin":"alert/close.png"}},{"type":"Button","props":{"y":545,"x":144,"var":"btn_previous","stateNum":1,"skin":"alert/previous.png"}},{"type":"Button","props":{"y":545,"x":870,"var":"btn_next","stateNum":1,"skin":"alert/next.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}