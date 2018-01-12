/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.assetsInPanel {
	import laya.ui.*;
	import laya.display.*; 
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInPanel;
	import com.lightUI.KGameComponents.assetsInPanel.LargePanel;
	import com.lightUI.KGameComponents.assetsInPanel.SmallPanel;

	public class AssetsInPanelUI extends View {
		public var largePanel:LargePanel;
		public var smallPanel:SmallPanel;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":319,"runtime":"com.lightUI.KGameComponents.assetsInPanel.AssetsInPanel","height":409},"child":[{"type":"LargePanel","props":{"y":0,"x":0,"var":"largePanel","runtime":"com.lightUI.KGameComponents.assetsInPanel.LargePanel"}},{"type":"SmallPanel","props":{"y":0,"x":0,"var":"smallPanel","runtime":"com.lightUI.KGameComponents.assetsInPanel.SmallPanel"}}]};
		override protected function createChildren():void {
			View.regComponent("com.lightUI.KGameComponents.assetsInPanel.AssetsInPanel",AssetsInPanel);
			View.regComponent("com.lightUI.KGameComponents.assetsInPanel.LargePanel",LargePanel);
			View.regComponent("com.lightUI.KGameComponents.assetsInPanel.SmallPanel",SmallPanel);
			super.createChildren();
			createView(uiView);
		}
	}
}