package view.hall
{
	import com.lightUI.core.Light;
	import com.lightUI.events.LightEvent;
	
	import chinadolls.model.vo.HallRoomVO;
	
	import laya.events.Event;
	import laya.ui.Box;
	import laya.ui.Button;
	import laya.ui.Image;
	import laya.ui.Label;
	import laya.ui.List;
	
	public class RoomListRender extends Box
	{
		private var _name_txt:Label;
		private var _bet_txt:Label;
		
		private var _cash_img:Image;
		private var _coin_img:Image;
		
		private var _state1:Image;
		private var _state2:Image;
		private var _state3:Image;
		
		public var index:int;
		private var _gray_img:Image;
		private var _enter_btn:Button;
		private var _room_item_img:Image;
		
		public function RoomListRender()
		{
			super();
			this.once(Event.ADDED,this, onAdded);
		}
		
		private function onAdded():void{
			_enter_btn = getChildByName("enter_btn") as Button;
			
			this.on(Event.CLICK,this, onEnterClick);
		}
		
		private function hideAllState():void{
			_state1.visible = false;
			_state2.visible = false;
			_state3.visible = false;
			_cash_img.visible = false;
			_coin_img.visible = false;
			_gray_img.visible = false;
		}
		
		private function showGray():void{
			_name_txt.visible = false;
			_bet_txt.visible = false;
			_state1.visible = false;
			_state2.visible = false;
			_state3.visible = false;
			_coin_img.visible = false;
			_cash_img.visible = false;
			_enter_btn.visible =false;
			_room_item_img.visible = false;
			_gray_img.visible = true;
		}
		private function showState(flg:int):void{
			hideAllState();
			if(flg == HallRoomVO.FREE) _state1.visible = true;
			else if(flg == HallRoomVO.BUSY) _state2.visible = true;
			else _state3.visible = true;
		}
		
		override public function set dataSource(value:*):void{
			if(value == null) return;
			super.dataSource = value;
			var data:HallRoomVO = value;
			if(data.rank == 2){
				_enter_btn.skin = Light.loader.getRes("hall/gaoji.png").url;
			}
		}
		
		private function onEnterClick(e:Event):void{
			if(this.dataSource) (parent.parent as List).event(LightEvent.ITEM_CLICK,this.dataSource);
		}
	}
}