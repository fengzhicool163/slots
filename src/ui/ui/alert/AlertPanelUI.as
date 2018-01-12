/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.alert {
	import laya.ui.*;
	import laya.display.*; 

	public class AlertPanelUI extends Dialog {
		public var txt_label:Label;
		public var cancelBtn:Button;
		public var ok_btn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":582,"height":291},"child":[{"type":"Image","props":{"y":-11,"x":-9,"skin":"alert/commonpanle.png"}},{"type":"Label","props":{"y":130,"x":139,"wordWrap":true,"width":304,"var":"txt_label","text":"label","name":"txt_label","height":23,"fontSize":20,"color":"#d4c2c2","align":"center"}},{"type":"Button","props":{"y":207,"x":324,"var":"cancelBtn","stateNum":1,"skin":"alert/cancle.png","name":"cancelBtn"}},{"type":"Button","props":{"y":207,"x":100,"var":"ok_btn","stateNum":1,"skin":"alert/confirm.png","name":"ok_btn"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}