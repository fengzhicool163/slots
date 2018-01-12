/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.assetsInPanel {
	import laya.ui.*;
	import laya.display.*; 
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider;

	public class SmallPanelUI extends Dialog {
		public var cancel_btn:Button;
		public var ok_btn:Button;
		public var maxmum_txt:Label;
		public var minmum_txt:Label;
		public var amount_describe_txt:Label;
		public var total_txt:Label;
		public var total_describe_txt:Label;
		public var roomName_txt:Label;
		public var close_btn:Button;
		public var amount_txt:Label;
		public var slider:AssetsInSlider;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":318,"height":256},"child":[{"type":"Image","props":{"y":1,"x":1,"width":318,"skin":"assetsIn/smallPanel.png","sizeGrid":"10,11,0,10","height":256}},{"type":"Button","props":{"y":213,"x":181,"width":83,"var":"cancel_btn","skin":"assetsIn/cancel.png","height":27}},{"type":"Button","props":{"y":213,"x":55,"width":83,"var":"ok_btn","skin":"assetsIn/ok.png","height":27}},{"type":"Image","props":{"y":193,"x":1,"width":318,"skin":"assetsIn/split.png","height":2}},{"type":"Label","props":{"y":169,"x":243,"width":82,"var":"maxmum_txt","text":"(1700)","height":14,"font":"微软雅黑","color":"#FFFFFF","align":"center"}},{"type":"Label","props":{"y":169,"x":-7,"width":82,"var":"minmum_txt","text":"(700)","height":14,"font":"微软雅黑","color":"#FFFFFF","align":"center"}},{"type":"Image","props":{"y":101,"x":1,"width":318,"skin":"assetsIn/split.png","height":2}},{"type":"Label","props":{"y":112,"x":50,"width":64,"var":"amount_describe_txt","text":"带入金额：","height":15,"font":"微软雅黑","color":"#b5b5b5"}},{"type":"Label","props":{"y":76,"x":131,"width":162,"var":"total_txt","text":"¥4512，567，57","height":14,"font":"微软雅黑","color":"#E8D07A","align":"right"}},{"type":"Label","props":{"y":76,"x":49,"width":66,"var":"total_describe_txt","text":"可用G 币：","height":16,"font":"微软雅黑","color":"#b5b5b5"}},{"type":"Label","props":{"y":44,"x":22,"width":277,"var":"roomName_txt","text":"新手场1桌","height":14,"color":"#b5b5b5","align":"center"}},{"type":"Image","props":{"y":7,"x":123,"skin":"assetsIn/carryInFont.png"}},{"type":"Button","props":{"y":3,"x":294,"var":"close_btn","skin":"assetsIn/close.png"}},{"type":"Label","props":{"y":113,"x":130,"width":162,"var":"amount_txt","text":"¥0","height":14,"font":"微软雅黑","color":"#E8D07A","align":"right"}},{"type":"AssetsInSlider","props":{"y":140,"x":7,"var":"slider","runtime":"com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider"}}]};
		override protected function createChildren():void {
			View.regComponent("com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider",AssetsInSlider);
			super.createChildren();
			createView(uiView);
		}
	}
}