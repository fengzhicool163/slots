/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.alert {
	import laya.ui.*;
	import laya.display.*; 

	public class AlertSimpleUI extends Dialog {
		public var txt:Label;
		public var ok_btn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":582,"height":291},"child":[{"type":"Image","props":{"y":-10,"x":0,"skin":"alert/commonpanle.png"}},{"type":"Label","props":{"y":121,"x":127,"wordWrap":true,"width":339,"var":"txt","text":"label","name":"txt","height":16,"fontSize":16,"color":"#d4c2c2","align":"center"}},{"type":"Button","props":{"y":203,"x":218,"var":"ok_btn","stateNum":1,"skin":"alert/confirm.png","name":"ok_btn"}},{"type":"Button","props":{"y":0,"x":548,"skin":"alert/btn_close.png","name":"closeBtn"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}