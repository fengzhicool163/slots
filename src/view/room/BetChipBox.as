package view.room
{
	
	import com.lightUI.core.Light;
	import com.lightUI.events.LightEvent;
	
	import laya.events.Event;
	import laya.ui.Image;
	import laya.utils.Ease;
	import laya.utils.Tween;
	
	import ui.ui.room.BetChipBoxUI;
	
	public class BetChipBox extends BetChipBoxUI
	{
		private var _currSelectChip:Image;
		private var _chipEnabled:Boolean;
		
		public function BetChipBox()
		{
			super();
			imgCircleFlash.visible=false;
		}
		
		public function setChipEnabled(value:Boolean):void{
			_chipEnabled = value;
			for (var i:int = 0; i < 4; i++) 
			{
				(this["chip_"+i] as Image).mouseEnabled = value;
				if(value == true){
					(this["chip_"+i] as Image).on(Event.CLICK,this, onChipClick);
				}else{
					(this["chip_"+i] as Image).off(Event.CLICK,this, onChipClick);
				}
				
			}
			this.disabled = !value;
		}
		
		public function defaultSelectChip():void{
			if(_currSelectChip) return;
			_currSelectChip = this["chip_0"] as Image;
			_currSelectChip.y -= 10;
			imgCircleFlash.y = _currSelectChip.y - 10;
			imgCircleFlash.x = _currSelectChip.x - 10;
			imgCircleFlash.visible = true;
			
			chipPointer.x = _currSelectChip.x + (_currSelectChip.width - chipPointer.width) * 0.5;
			event(LightEvent.ITEM_CLICK,_currSelectChip);
		}
		
		
		private function onChipClick(e:Event):void{
			if(_currSelectChip) _currSelectChip.y += 10;
			_currSelectChip = e.target as Image;
		 	_currSelectChip.y -= 10;
		 	imgCircleFlash.y = _currSelectChip.y - 10;
			imgCircleFlash.x = _currSelectChip.x - 10;
			imgCircleFlash.visible = true;
			
			Tween.to(chipPointer, {x:_currSelectChip.x + (_currSelectChip.width - chipPointer.width) * 0.5}, 500, Ease.strongOut);
			event(LightEvent.ITEM_CLICK,_currSelectChip);
		}

		public function get currSelectChip():Image
		{
			return _currSelectChip;
		}

		public function set currSelectChip(value:Image):void
		{
			_currSelectChip = value;
		}

		/**
		 * 更新界面上的筹码显示 
		 */		
		public function updateData(arr:Array):void
		{
			for (var i:int = 0; i < 4; i++) //最后一个筹码是max
			{
				(this["chip_"+i] as Image).source = Light.loader.getRes("room/chip_"+arr[i]+".png");
			}
		}
		
	}
}