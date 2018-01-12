/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BetTotalAmountUI extends View {
		public var txt_totalBet:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":185,"height":30},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"room/total_bg.png"}},{"type":"Label","props":{"y":3,"x":38,"text":"总：","fontSize":18,"font":"Microsoft YaHei","color":"#f6f0ef"}},{"type":"Label","props":{"y":2,"x":73,"width":93,"var":"txt_totalBet","text":"1354354","name":"txt_totalBet","height":22,"fontSize":20,"font":"Microsoft YaHei","color":"#f6f0ef"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}