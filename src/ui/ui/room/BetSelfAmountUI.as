/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BetSelfAmountUI extends View {
		public var txt_bet:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":185,"height":30},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"room/betMoneyBg.png"}},{"type":"Label","props":{"y":3,"x":54,"width":93,"var":"txt_bet","text":"1354354","name":"txt_bet","height":22,"font":"betAmount","color":"#a6a09f"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}