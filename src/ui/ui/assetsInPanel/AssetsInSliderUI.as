/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.assetsInPanel {
	import laya.ui.*;
	import laya.display.*; 
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider;

	public class AssetsInSliderUI extends View {
		public var slider:HSlider;
		public var min_btn:Button;
		public var max_btn:Button;
		public var slider_bar:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":310,"runtime":"com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider","height":33},"child":[{"type":"HSlider","props":{"y":10,"x":58,"width":189,"var":"slider","skin":"assetsIn/hslider.png","showLabel":false,"height":16}},{"type":"Button","props":{"y":0,"x":0,"width":52,"var":"min_btn","skin":"assetsIn/lowest.png","height":27}},{"type":"Button","props":{"y":0,"x":251,"width":52,"var":"max_btn","skin":"assetsIn/highest.png","height":27}},{"type":"Image","props":{"y":10,"x":58,"width":188,"var":"slider_bar","skin":"assetsIn/bar_hslider.png","sizeGrid":"0,8,0,10","height":8}}]};
		override protected function createChildren():void {
			View.regComponent("com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider",AssetsInSlider);
			super.createChildren();
			createView(uiView);
		}
	}
}