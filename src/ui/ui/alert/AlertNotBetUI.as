/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.alert {
	import laya.ui.*;
	import laya.display.*; 

	public class AlertNotBetUI extends View {
		public var msgTxt:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":831,"mouseThrough":true,"height":110},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"alert/img_hint_1.png","mouseThrough":true}},{"type":"Label","props":{"y":22,"x":127,"width":576,"var":"msgTxt","valign":"middle","text":"您已经3次未下注，5次未下注将被请出房间！","name":"msgTxt","height":53,"fontSize":24,"font":"Microsoft YaHei","color":"#ffffff","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}