/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.bigwin {
	import laya.ui.*;
	import laya.display.*; 

	public class BigWinUI extends Dialog {
		public var effect:View;
		public var rewardNum:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":1136,"height":640},"child":[{"type":"View","props":{"y":0,"x":0,"width":1136,"var":"effect","height":640}},{"type":"Image","props":{"y":69,"x":280,"skin":"bigwin/bigbonuspanel.png"},"child":[{"type":"Label","props":{"y":201,"x":192,"width":476,"var":"rewardNum","text":"0.00","scaleY":0.45,"scaleX":0.45,"height":169,"fontSize":80,"font":"big","color":"#ffffff","align":"center"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}