package view.alert
{
	import com.lightUI.core.Light;
	import com.lightUI.manager.PopupManager;
	
	import chinadolls.events.GameEvent;
	
	import laya.events.Event;
	import laya.utils.Color;
	
	import ui.ui.alert.SetPanelUI;
	
	public class MusicSetPanel extends SetPanelUI
	{
		public function MusicSetPanel()
		{
			super();
		}
		
		override protected function createChildren():void{
			super.createChildren();
			
			closeBtn.on(Event.CLICK, this, onClick);
			closeEffect.on(Event.CLICK,this, onVoiceClick);
			closeMusic.on(Event.CLICK,this, onMusicClick);
			openEffect.on(Event.CLICK,this, onVoiceClick);
			openMusic.on(Event.CLICK,this, onMusicClick);
			
		}
		
		private function onVoiceClick():void
		{
			changEffect();
		}
		
		private function onMusicClick():void
		{
			changeSound();
		}
		
		private function changeSound():void
		{
//			var musicBol:Boolean = musicBtn.selected;
//			var voiceBol:Boolean = voiceBtn.selected;
			closeMusic.visible = !closeMusic.visible;
			openMusic.visible = !openMusic.visible;
			
			
			var soundObj:Object = new Object();
			soundObj["musicOnBol"] = openMusic.visible;
			soundObj["voiceOnBol"] = openEffect.visible;
			
			event(GameEvent.CHANGE_SOUND_EVENT, soundObj);
		}
		
		
		private function changEffect():void{
			
			closeEffect.visible = !closeEffect.visible;
			openEffect.visible = !openEffect.visible;
			var soundObj:Object = new Object();
			soundObj["musicOnBol"] = openMusic.visible;
			soundObj["voiceOnBol"] = openEffect.visible;
			
			event(GameEvent.CHANGE_SOUND_EVENT, soundObj);
			
			
		}
		
		public function setMusicVoice(_musicOnBol:Boolean, _voiceOnBol:Boolean):void
		{
			openMusic.visible = _musicOnBol;
			openEffect.visible = _voiceOnBol;
			closeEffect.visible = !_voiceOnBol;
			closeMusic.visible = !_musicOnBol;
//			versionTxt.text = BaseStaticFunc.format("Version {0}",version);
			
		}
		
		private function onClick():void
		{
			PopupManager.removePopUp(this);
			visible = false;
		}
		
		override public function show(closeOther:Boolean=false):void{
			//			super.show(closeOther);
			popup(closeOther);
			PopupManager.addPopUp(this,Light.root,true, Color.create("#010101"));
			PopupManager.centerPopUp(this);
			visible = true;
		}
		
		override public function close(type:String=null):void{
			//			super.close(type);
			PopupManager.removePopUp(this);
			visible = false;
		}
		
	}
}