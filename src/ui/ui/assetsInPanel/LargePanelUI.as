/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.assetsInPanel {
	import laya.ui.*;
	import laya.display.*; 
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider;

	public class LargePanelUI extends Dialog {
		public var btn_canel:Button;
		public var btn_ok:Button;
		public var tips_txt:Label;
		public var btnClose:Button;
		public var roomName_txt:Label;
		public var takeInTxt:Label;
		public var range_txt:Label;
		public var amount_total_txt:Label;
		public var total_cash_txt:Label;
		public var total_nm_txt:Label;
		public var cash_txt:Label;
		public var nm_txt:Label;
		public var cash_slider:AssetsInSlider;
		public var nm_slider:AssetsInSlider;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":319,"text":"0.00","height":409},"child":[{"type":"Image","props":{"y":0,"x":0,"width":318,"skin":"assetsIn/longPanel.png","sizeGrid":"10,11,0,10","height":409}},{"type":"Button","props":{"y":366,"x":180,"width":83,"var":"btn_canel","stateNum":3,"skin":"assetsIn/cancel.png","height":27}},{"type":"Button","props":{"y":366,"x":54,"width":83,"var":"btn_ok","skin":"assetsIn/ok.png","height":27}},{"type":"Label","props":{"y":339,"x":100,"width":136,"var":"tips_txt","text":"投注优先扣除拟码","height":18,"fontSize":15,"font":"微软雅黑","color":"#FF6511","align":"left"}},{"type":"Button","props":{"y":2,"x":293,"width":23,"var":"btnClose","skin":"assetsIn/close.png","height":23}},{"type":"Image","props":{"y":6,"x":120,"skin":"assetsIn/carryInFont.png"}},{"type":"Label","props":{"y":41,"x":19,"width":281,"var":"roomName_txt","text":"新手桌","height":18,"fontSize":14,"color":"#b5b5b5","align":"center"}},{"type":"Label","props":{"y":76,"x":49,"width":64,"var":"takeInTxt","text":"带入范围：","name":"takeInTxt","height":22,"fontSize":14,"font":"微软雅黑","color":"#aeaeae","align":"center"}},{"type":"Label","props":{"y":76,"x":185,"width":70,"var":"range_txt","text":"0.3-0.7","height":16,"fontSize":14,"color":"#FFFFFF","align":"right"}},{"type":"Label","props":{"y":111,"x":49,"width":64,"text":"可用现金：","height":16,"fontSize":14,"font":"微软雅黑","color":"#aeaeae","align":"center"}},{"type":"Label","props":{"y":181,"x":49,"width":64,"text":"可用拟码：","name":"roomName_txt","height":16,"fontSize":14,"font":"微软雅黑","color":"#aeaeae","align":"center"}},{"type":"Label","props":{"y":257,"x":118,"width":168,"var":"amount_total_txt","text":"0.00","height":16,"fontSize":14,"color":"#FFFFFF","align":"left"}},{"type":"Label","props":{"y":117,"x":185,"width":70,"var":"total_cash_txt","text":"0.3-0.7","height":16,"fontSize":14,"color":"#FFFFFF","align":"right"}},{"type":"Label","props":{"y":305,"x":49,"width":41,"text":"拟 码：","height":16,"fontSize":14,"font":"微软雅黑","color":"#aeaeae","bold":false,"align":"left"}},{"type":"Label","props":{"y":253,"x":49,"width":39,"text":"总 计：","height":15,"fontSize":14,"font":"微软雅黑","color":"#aeaeae","align":"left"}},{"type":"Label","props":{"y":279,"x":49,"width":39,"text":"现 金：","height":16,"fontSize":14,"font":"微软雅黑","color":"#aeaeae","align":"left"}},{"type":"Image","props":{"y":100,"x":0,"width":318,"skin":"assetsIn/split.png","height":2}},{"type":"Label","props":{"y":181,"x":185,"width":70,"var":"total_nm_txt","text":"0.3-0.7","height":16,"fontSize":14,"color":"#FFFFFF","align":"right"}},{"type":"Image","props":{"y":172,"x":0,"width":318,"skin":"assetsIn/split.png","height":2}},{"type":"Image","props":{"y":243,"x":0,"width":318,"skin":"assetsIn/split.png","height":2}},{"type":"Label","props":{"y":282,"x":118,"width":171,"var":"cash_txt","text":"0.00","height":16,"fontSize":14,"color":"#FFFFFF","align":"left"}},{"type":"Label","props":{"y":306,"x":118,"width":169,"var":"nm_txt","text":"0.00","height":16,"fontSize":14,"color":"#FFFFFF","align":"left"}},{"type":"Image","props":{"y":327,"x":0,"width":318,"skin":"assetsIn/split.png","height":2}},{"type":"Image","props":{"y":338,"x":74,"width":22,"skin":"assetsIn/warn2.png","height":18}},{"type":"AssetsInSlider","props":{"y":137,"x":8,"var":"cash_slider","runtime":"com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider"}},{"type":"AssetsInSlider","props":{"y":210,"x":6,"var":"nm_slider","runtime":"com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider"}}]};
		override protected function createChildren():void {
			View.regComponent("com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider",AssetsInSlider);
			super.createChildren();
			createView(uiView);
		}
	}
}