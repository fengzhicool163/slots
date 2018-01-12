/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.slots {
	import laya.ui.*;
	import laya.display.*; 

	public class SetResulteUI extends View {
		public var tx1:TextInput;
		public var tx2:TextInput;
		public var tx3:TextInput;
		public var tx4:TextInput;
		public var tx5:TextInput;
		public var tx6:TextInput;
		public var tx11:TextInput;
		public var tx7:TextInput;
		public var tx12:TextInput;
		public var tx8:TextInput;
		public var tx13:TextInput;
		public var tx9:TextInput;
		public var tx14:TextInput;
		public var tx10:TextInput;
		public var tx15:TextInput;
		public var btn_spin:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"height":600},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1136,"skin":"slots/guoqi.jpg","height":650}},{"type":"TextInput","props":{"y":24,"x":31,"width":117,"var":"tx1","text":"10","height":32,"fontSize":30,"color":"#000000"}},{"type":"TextInput","props":{"y":24,"x":213,"width":119,"var":"tx2","text":"4","height":35,"fontSize":30,"color":"#000000"}},{"type":"TextInput","props":{"y":24,"x":427,"width":119,"var":"tx3","text":"5","height":39,"fontSize":30,"color":"#000000"}},{"type":"TextInput","props":{"y":24,"x":624,"width":119,"var":"tx4","text":"5","height":39,"fontSize":30,"color":"#000000"}},{"type":"TextInput","props":{"y":24,"x":852,"width":119,"var":"tx5","text":"5","height":36,"fontSize":30,"color":"#000000"}},{"type":"TextInput","props":{"y":163,"x":29,"width":119,"var":"tx6","text":"6","height":35,"fontSize":30,"color":"#000000"}},{"type":"TextInput","props":{"y":317,"x":29,"width":119,"var":"tx11","text":"6","height":33,"fontSize":30,"color":"#000000"}},{"type":"TextInput","props":{"y":163,"x":213,"width":119,"var":"tx7","text":"7","height":33,"fontSize":30,"color":"#000000"}},{"type":"TextInput","props":{"y":317,"x":213,"width":119,"var":"tx12","text":"9","height":33,"fontSize":30,"color":"#000000"}},{"type":"TextInput","props":{"y":163,"x":427,"width":119,"var":"tx8","text":"2","height":34,"fontSize":30,"color":"#000000"}},{"type":"TextInput","props":{"y":317,"x":427,"width":119,"var":"tx13","text":"10","height":37,"fontSize":30,"color":"#000000"}},{"type":"TextInput","props":{"y":163,"x":624,"width":119,"var":"tx9","text":"9","height":36,"fontSize":30,"color":"#000000"}},{"type":"TextInput","props":{"y":317,"x":624,"width":119,"var":"tx14","text":"6","height":34,"fontSize":30,"color":"#000000"}},{"type":"TextInput","props":{"y":163,"x":852,"width":119,"var":"tx10","text":"4","height":36,"fontSize":30,"color":"#000000"}},{"type":"TextInput","props":{"y":317,"x":852,"width":119,"var":"tx15","text":"8","height":36,"fontSize":30,"color":"#000000"}},{"type":"Image","props":{"y":435,"x":943,"skin":"slots/frame_spin.png"}},{"type":"Button","props":{"y":446,"x":952,"var":"btn_spin","stateNum":1,"skin":"slots/spin.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}