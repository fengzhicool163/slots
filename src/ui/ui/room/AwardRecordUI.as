/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import view.room.AwardRecordListRender;

	public class AwardRecordUI extends View {
		public var btnTriangle:Button;
		public var awardList:List;
		public var imgBg:Image;
		public var txtPokerType:Label;
		public var btnMore:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":100,"height":426},"child":[{"type":"Image","props":{"y":0,"x":-70,"skin":"room/recordon-bg.png"}},{"type":"Button","props":{"y":209,"x":10,"var":"btnTriangle","skin":"room/record-triangle.png","pivotY":11.5,"pivotX":10.5,"name":"btnTriangle"}},{"type":"List","props":{"y":44,"x":-62,"width":60,"var":"awardList","spaceY":3,"repeatY":9,"repeatX":1,"name":"awardList","height":321},"child":[{"type":"Box","props":{"runtime":"view.room.AwardRecordListRender","name":"render"},"child":[{"type":"Image","props":{"var":"imgBg","skin":"room/bluecard.png","name":"imgBg"}},{"type":"Label","props":{"y":0,"x":0,"width":52,"var":"txtPokerType","valign":"middle","text":"同花顺","name":"txtPokerType","height":31,"fontSize":14,"font":"Arial","color":"#e5dada","bold":true,"align":"center"}}]}]},{"type":"Button","props":{"y":376,"x":-61,"var":"btnMore","skin":"room/more.png","name":"btnMore"}}]};
		override protected function createChildren():void {
			View.regComponent("view.room.AwardRecordListRender",AwardRecordListRender);
			super.createChildren();
			createView(uiView);
		}
	}
}