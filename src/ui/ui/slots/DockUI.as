/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.slots {
	import laya.ui.*;
	import laya.display.*; 

	public class DockUI extends View {
		public var btn_auto:Button;
		public var btn_lines:Button;
		public var btn_bet:Button;
		public var btn_common:Button;
		public var btn_add:Button;
		public var btn_fast:Button;
		public var btn_stop:Button;
		public var start:Button;
		public var playerIcon:Image;
		public var username:Label;
		public var cash:Label;
		public var betLevel:Label;
		public var linenum:Label;
		public var reward:Label;
		public var betLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"visible":false,"height":201},"child":[{"type":"Image","props":{"y":75,"x":517,"skin":"slots/bonus.png"}},{"type":"Image","props":{"y":95,"x":871,"skin":"slots/frame_auto.png"}},{"type":"Button","props":{"y":104,"x":880,"var":"btn_auto","stateNum":1,"skin":"slots/auto.png"}},{"type":"Image","props":{"y":107,"x":316,"skin":"slots/frame_linenum.png"}},{"type":"Image","props":{"y":107,"x":417,"skin":"slots/frame_linevalue.png"}},{"type":"Image","props":{"y":92,"x":761,"skin":"slots/frame_speedup.png"}},{"type":"Image","props":{"y":45,"x":981,"skin":"slots/frame_spin.png"}},{"type":"Button","props":{"y":113,"x":322,"var":"btn_lines","stateNum":1,"skin":"slots/linenum.png"}},{"type":"Button","props":{"y":113,"x":422,"var":"btn_bet","stateNum":1,"skin":"slots/linevalue.png"}},{"type":"Button","props":{"y":103,"x":770,"visible":false,"var":"btn_common","stateNum":1,"skin":"slots/normal.png"}},{"type":"Image","props":{"y":122,"x":246,"skin":"slots/frame_recharge.png"}},{"type":"Button","props":{"y":130,"x":256,"var":"btn_add","stateNum":1,"skin":"slots/recharge.png"}},{"type":"Button","props":{"y":103,"x":770,"var":"btn_fast","stateNum":1,"skin":"slots/speedup.png"}},{"type":"Button","props":{"y":57,"x":992,"width":135,"var":"btn_stop","stateNum":1,"skin":"slots/stop.png","sizeGrid":"-23,0,-53,0","height":142}},{"type":"Button","props":{"y":57,"x":990,"var":"start","stateNum":1,"skin":"slots/spin.png"}},{"type":"Image","props":{"y":116,"x":-2,"skin":"slots/playerinfo.png"}},{"type":"Image","props":{"y":125,"x":16,"width":55,"var":"playerIcon","height":56}},{"type":"Box","props":{"y":115,"x":84},"child":[{"type":"Label","props":{"y":13,"x":67,"width":134,"var":"username","text":"0","height":18,"fontSize":18,"color":"#ffffff","anchorX":0.5,"align":"center"}},{"type":"Label","props":{"y":44,"x":66,"width":134,"var":"cash","text":"0","scaleY":0.6,"scaleX":0.6,"height":18,"fontSize":18,"font":"bnt","color":"#ffffff","anchorX":0.5,"align":"center"}},{"type":"Label","props":{"y":37,"x":377,"width":68,"var":"betLevel","text":"1","scaleY":0.6,"scaleX":0.6,"pivotX":34,"height":38,"fontSize":10,"font":"bnt","color":"#ffffff","align":"center"}},{"type":"Label","props":{"y":36,"x":279,"width":66,"var":"linenum","text":"5","scaleY":0.6,"scaleX":0.6,"pivotX":33,"height":39,"fontSize":10,"font":"bnt","color":"#ffffff","align":"center"}},{"type":"Label","props":{"y":34,"x":559,"width":23,"var":"reward","text":"0","height":34,"fontSize":15,"font":"bnt","color":"#ffffff","anchorY":1,"anchorX":0.5,"align":"center"}},{"type":"Label","props":{"y":43,"x":574,"width":22,"var":"betLabel","text":"0","scaleY":0.8,"scaleX":0.8,"height":32,"fontSize":18,"font":"bnt","color":"#ffffff","anchorX":0.5,"align":"center"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}