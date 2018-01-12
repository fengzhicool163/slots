/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.alert {
	import laya.ui.*;
	import laya.display.*; 

	public class SetPanelUI extends Dialog {
		public var closeBtn:Button;
		public var languageTxt:Label;
		public var closeEffect:Button;
		public var openEffect:Button;
		public var openMusic:Button;
		public var closeMusic:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":582,"height":400},"child":[{"type":"Image","props":{"y":-42,"x":0,"skin":"slots/setuppanel.png"}},{"type":"Button","props":{"y":283,"x":207,"var":"closeBtn","stateNum":1,"skin":"alert/close.png","name":"closeBtn"}},{"type":"Label","props":{"y":122,"x":260,"width":98,"var":"languageTxt","underline":true,"text":"简体中文","name":"languageTxt","height":29,"fontSize":18,"color":"#dbd2d2"}},{"type":"Button","props":{"y":212,"x":149,"visible":false,"var":"closeEffect","stateNum":1,"skin":"alert/unchosen.png"}},{"type":"Button","props":{"y":212,"x":229,"var":"openEffect","stateNum":1,"skin":"alert/chosen.png"}},{"type":"Button","props":{"y":212,"x":462,"var":"openMusic","stateNum":1,"skin":"alert/chosen.png"}},{"type":"Button","props":{"y":212,"x":385,"visible":false,"var":"closeMusic","stateNum":1,"skin":"alert/unchosen.png"}},{"type":"Label","props":{"y":11,"x":495,"text":"v0.0.6","fontSize":20,"color":"#dbd2d2"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}