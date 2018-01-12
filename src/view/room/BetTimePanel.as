package view.room
{
	import com.lightUI.core.Light;
	import com.lightUI.manager.timer.Timer;
	
	import chinadolls.model.MySoundManager;
	
	import laya.display.Sprite;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	import ui.ui.room.BetTimePanelUI;
	
	
	/**
	 * 下注时间倒计时
	 */	
	public class BetTimePanel extends BetTimePanelUI
	{		
		private var _time:int;
		
		private var _per_sec_value:Number;
		private var _start_angel:Number;		
				
		private var _timer_idx:int;
		private var timer:Timer;
		private var timeIndex:int;
		private var timePieIndex:int;
		
		public function BetTimePanel()
		{
			//trace("=====BetTimePanelUI======")
			super();
			timer = Light.timer;
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
		}
		
		public function hide():void
		{			
			_time = 0;
			Tween.to(this, { }, 100, Ease.cubicOut,Handler.create(this,ani_ok));
			Tween.to(this, {y:-150, alpha:0},500, Ease.strongOut);
			timer.clearInterval(timeIndex);
			timer.clearInterval(timePieIndex);
//			Laya.timer.clear(this, timerHandler);
			
		}
		
		public function set_data(data:Array):void
		{
			this.visible = true;
			_time = data[0];
			bt_txt.text = _time.toString();			
			
			light.interval = 100;
			light.x = 242;
			light.y = 102;
			light.visible = true;
			light.play();
			
			light.pivotX = -18;
			light.pivotY = 21;
			
			_start_angel = -90;
			//360度 / 秒數 =  每100毫需要減少的角度
			_per_sec_value = 360 / (_time * 10);
			//trace("_per_sec_value = "+_per_sec_value);
			var sp:Sprite = new Sprite();			
			mcbg.mask = null;
			sp.graphics.drawPie(242, 100, 36, _start_angel, 270, "#FF0000");
			mcbg.mask = sp;
			
			timeIndex = timer.setInterval(this, timerHandler, 1000, null);
			timePieIndex = timer.setInterval(this, pie, 100, null);
//			Laya.timer.loop(1000, this, timerHandler);			
//			Laya.timer.loop(100, this, pie);			
			
			
		}
		
		public function pie():void
		{
			_start_angel += _per_sec_value;
			//trace("_start_angel = " + _start_angel);
			if ( _start_angel >= 360) _start_angel = 362;
			var sp:Sprite = new Sprite();
			mcbg.mask = null;
			sp.graphics.drawPie(36, 33, 36, _start_angel , 270, "#FF0000");
			mcbg.mask = sp;			
			
			var de:Number = _start_angel;		
			light.rotation = de;
		}
		
		public function timerHandler():void
		{
			_time -= 1;	
			if ( _time <= 0) _time = 0;
			bt_txt.text = _time.toString();
			if (_time == 0)
			{				
				hide();
			}
			
			if( _time <=3)
			{
				//TODO 閃光提示	
				showBgLight();
				MySoundManager.getInstance().playVoiceSound("BetTimeOver");
			}
		}
		
		private function showBgLight():void{
			ani1.play(0,false);
		}
		
		private function ani_ok():void
		{
//			timer.clearInterval(timeIndex);
//			timer.clearInterval(timePieIndex);
			this.visible = false;
		}
		
		private function test():void
		{
//			view.TimerPanel.set_data([10]);			
//			view.TimerPanel.hide();
		}
	}
}