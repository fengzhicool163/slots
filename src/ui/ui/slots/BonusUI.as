/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.slots {
	import laya.ui.*;
	import laya.display.*; 

	public class BonusUI extends View {
		public var ani1:FrameAnimation;
		public var ani2:FrameAnimation;
		public var ani3:FrameAnimation;
		public var timeLabel:Label;
		public var s1:Sprite;
		public var s:Sprite;
		public var s2:Sprite;
		public var rewardLabel:Label;
		public var aniImage:Image;
		public var rewardNum:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"height":640},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"slots/bonuspanel.jpg"}},{"type":"Label","props":{"y":149,"x":507,"text":"倒计时:","fontSize":20,"color":"#ffffff"}},{"type":"Label","props":{"y":149,"x":576,"var":"timeLabel","text":"0:30","fontSize":20,"color":"#ffffff"}},{"type":"Sprite","props":{"y":147,"x":446,"width":248,"var":"s1","height":304}},{"type":"Sprite","props":{"y":147,"x":178,"width":248,"var":"s","height":304}},{"type":"Sprite","props":{"y":147,"x":717,"width":248,"var":"s2","height":304}},{"type":"Image","props":{"y":26,"x":387,"skin":"slots/bonuslogo.png","scaleY":0.6,"scaleX":0.6}},{"type":"Image","props":{"y":520,"x":354,"skin":"slots/freegamebonus.png"}},{"type":"Label","props":{"y":556,"x":486,"width":266,"var":"rewardLabel","text":"0","pivotX":0,"height":40,"fontSize":40,"font":"bnt","color":"#ffffff","align":"center"}},{"type":"Image","props":{"y":294,"x":190,"visible":false,"var":"aniImage","skin":"slots/bonuspanel2.png"},"compId":13,"child":[{"type":"Label","props":{"y":25,"x":20,"width":174,"var":"rewardNum","text":"12.12","height":32,"font":"bnt","align":"center"}}]}],"animations":[{"nodes":[{"target":13,"keyframes":{"y":[{"value":294,"tweenMethod":"linearNone","tween":true,"target":13,"key":"y","index":0},{"value":206,"tweenMethod":"linearNone","tween":true,"target":13,"key":"y","index":10}],"alpha":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":13,"key":"alpha","index":0},{"value":1,"tweenMethod":"linearNone","tween":true,"target":13,"key":"alpha","index":10}]}}],"name":"ani1","id":1,"frameRate":24,"action":0},{"nodes":[{"target":13,"keyframes":{"y":[{"value":294,"tweenMethod":"linearNone","tween":true,"target":13,"key":"y","index":0},{"value":206,"tweenMethod":"linearNone","tween":true,"target":13,"key":"y","index":10}],"x":[{"value":460,"tweenMethod":"linearNone","tween":true,"target":13,"key":"x","index":0}],"alpha":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":13,"key":"alpha","index":0},{"value":1,"tweenMethod":"linearNone","tween":true,"target":13,"key":"alpha","index":10}]}}],"name":"ani2","id":2,"frameRate":24,"action":0},{"nodes":[{"target":13,"keyframes":{"y":[{"value":294,"tweenMethod":"linearNone","tween":true,"target":13,"key":"y","index":0},{"value":206,"tweenMethod":"linearNone","tween":true,"target":13,"key":"y","index":10}],"x":[{"value":737,"tweenMethod":"linearNone","tween":true,"target":13,"key":"x","index":0}],"alpha":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":13,"key":"alpha","index":0},{"value":1,"tweenMethod":"linearNone","tween":true,"target":13,"key":"alpha","index":10}]}}],"name":"ani3","id":3,"frameRate":24,"action":0}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}