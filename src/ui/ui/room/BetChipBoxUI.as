/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BetChipBoxUI extends View {
		public var chip_0:Image;
		public var chip_1:Image;
		public var chip_2:Image;
		public var chip_3:Image;
		public var imgCircleFlash:Image;
		public var chipPointer:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":480,"height":120},"child":[{"type":"Image","props":{"y":21,"x":66,"var":"chip_0","skin":"room/chip_1.png","name":"chip_0"}},{"type":"Image","props":{"y":20,"x":160,"var":"chip_1","skin":"room/chip_5.png","name":"chip_1"}},{"type":"Image","props":{"y":20,"x":254,"var":"chip_2","skin":"room/chip_10.png","name":"chip_2"}},{"type":"Image","props":{"y":20,"x":348,"var":"chip_3","skin":"room/chip_20.png","name":"chip_3"}},{"type":"Image","props":{"y":24,"x":45,"var":"imgCircleFlash","skin":"room/chip-light.png","name":"imgCircleFlash"}},{"type":"Image","props":{"y":89,"x":187,"var":"chipPointer","skin":"room/pointer.png","name":"chipPointer"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}