/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.hall {
	import laya.ui.*;
	import laya.display.*; 
	import view.hall.RoomListRender;

	public class HallUI extends View {
		public var btnExit:Button;
		public var imgSetBackground:Image;
		public var btnEdite:Button;
		public var btnSet:Button;
		public var btnRule:Button;
		public var list:List;
		public var enter_btn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"y":0,"x":0,"width":1136,"height":640},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"hall/table_background.jpg"}},{"type":"Box","props":{"mouseThrough":true},"child":[{"type":"Button","props":{"y":2,"x":2,"var":"btnExit","skin":"hall/btn_return.png","name":"btnExit"}},{"type":"Image","props":{"y":5,"x":1069,"var":"imgSetBackground","skin":"hall/img_comp_background.png","name":"imgSetBackground"}},{"type":"VBox","props":{"y":2,"x":-9,"mouseThrough":true},"child":[{"type":"Button","props":{"y":0,"x":1072,"var":"btnEdite","skin":"hall/btn_modify.png","name":"btnEdite"}},{"type":"Button","props":{"y":74,"x":1078,"var":"btnSet","skin":"hall/btn_set.png","name":"btnSet"}},{"type":"Button","props":{"y":136,"x":1078,"var":"btnRule","skin":"hall/btn_rule.png","name":"btnRule"}}]}]},{"type":"List","props":{"y":264,"x":643,"width":392,"var":"list","spaceY":40,"repeatY":1,"repeatX":1,"height":335},"child":[{"type":"Box","props":{"y":0,"x":0,"runtime":"view.hall.RoomListRender","name":"render"},"child":[{"type":"Button","props":{"var":"enter_btn","skin":"hall/chuji.png","name":"enter_btn"}}]},{"type":"VScrollBar","props":{"y":0,"x":372,"touchScrollEnable":false,"skin":"comp/vscroll.png","name":"scrollBar","mouseWheelEnable":false,"autoHide":true}}]}]};
		override protected function createChildren():void {
			View.regComponent("view.hall.RoomListRender",RoomListRender);
			super.createChildren();
			createView(uiView);
		}
	}
}