/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.smallLoading {
	import laya.ui.*;
	import laya.display.*; 

	public class small_loadingUI extends View {
		public var ani1:FrameAnimation;
		public var txt:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"height":640},"child":[{"type":"Image","props":{"y":294,"x":542,"skin":"smallLoading/smallLoading.png"},"compId":2},{"type":"Label","props":{"y":378,"x":516,"width":103,"var":"txt","text":"努力加载中...","name":"txt","height":26,"color":"#FFFFFF","align":"center"}}],"animations":[{"nodes":[{"target":2,"keyframes":{"y":[{"value":319,"tweenMethod":"linearNone","tween":true,"target":2,"key":"y","index":0}],"x":[{"value":567,"tweenMethod":"linearNone","tween":true,"target":2,"key":"x","index":0}],"rotation":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":2,"key":"rotation","index":0},{"value":360,"tweenMethod":"linearNone","tween":true,"target":2,"key":"rotation","index":30}],"pivotY":[{"value":25.5,"tweenMethod":"linearNone","tween":true,"target":2,"key":"pivotY","index":0}],"pivotX":[{"value":25.5,"tweenMethod":"linearNone","tween":true,"target":2,"key":"pivotX","index":0}]}}],"name":"ani1","id":1,"frameRate":24,"action":0}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}