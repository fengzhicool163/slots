/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.slots {
	import laya.ui.*;
	import laya.display.*; 

	public class LineViewUI extends View {
		public var selected:Image;
		public var unselect:Image;
		public var linenum:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":20,"height":20},"child":[{"type":"Image","props":{"y":0,"x":0,"var":"selected","skin":"slots/linepanel_h.png"}},{"type":"Image","props":{"y":0,"x":0,"var":"unselect","skin":"slots/linepanel_n.png"}},{"type":"Label","props":{"y":1,"x":3,"width":11,"var":"linenum","text":"2","height":32,"font":"line","color":"#ffffff","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}