/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.tipsLoading {
	import laya.ui.*;
	import laya.display.*; 

	public class tipsLoadPanelUI extends View {
		public var progressImg:Image;
		public var imgMask:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"height":640},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"loading/loading-bg.jpg"}},{"type":"Image","props":{"y":479,"x":193,"visible":false,"skin":"loading/loadingBox.png"}},{"type":"Image","props":{"y":500,"x":200,"width":739,"var":"progressImg","skin":"loading/loading.png","name":"progressImg","height":33},"child":[{"type":"Sprite","props":{"y":-14,"x":-115,"width":1007,"var":"imgMask","renderType":"mask","name":"imgMask","height":74},"child":[{"type":"Rect","props":{"y":-1,"x":-740,"width":880,"lineWidth":1,"height":67,"fillColor":"#141413"}}]}]},{"type":"Label","props":{"y":455,"x":533,"text":"loading...","fontSize":25,"color":"#ffffff"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}