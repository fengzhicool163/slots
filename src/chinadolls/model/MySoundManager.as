package chinadolls.model
{
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.parrerns.Model;
	
	import chinadolls.service.SharedObjectService;
	
	
	import laya.media.SoundChannel;
	import laya.media.SoundManager;
	import laya.utils.Handler;
	

	
	public class MySoundManager extends Model implements IModel
	{
		public static const NAME:String = "mySoundManager";
		static private var _instance:MySoundManager;
		
		private const MEDIA_PATH:String = "sound/";
		private var sharedObjectService:SharedObjectService;
		
		private var currentSoundChannel:SoundChannel;
		private var __pausePosition:Number;
		
		public function MySoundManager(modelName:String=null, data:Object=null)
		{
			super(modelName, data);
			_instance = this
		}
		
		override public function getInjector():Array{
			return [SharedObjectService.NAME]
		} 
		
		
		static public function getInstance():MySoundManager{
			if(!_instance)
				_instance = new MySoundManager();
			
			return _instance;
		}
		/**
		 * 设置sessionName 
		 * @param _sessionName
		 * 
		 */		
		public function set musicSessionName(_sessionName:String):void
		{
			sharedObjectService.init(_sessionName);
		}
		
		//设置获取背景音乐和音效
		public function set musicOnBol(_musicOnBol:Boolean):void
		{
			sharedObjectService.setMusic(_musicOnBol);
			
			//停止背景音乐的播放
			if(SoundManager.musicMuted)
				stopBgMusic();
			else
				playOneBgMusic();
		}
		
		
		public function get musicOnBol():Boolean
		{
			return sharedObjectService.music;
		}
		
		public function set voiceOnBol(_voiceOnBol:Boolean):void
		{
			sharedObjectService.setSound(_voiceOnBol);
		}
		
		public function get voiceOnBol():Boolean
		{
			return sharedObjectService.sound;
		}
		//设置获取背景音乐和音效
		public function playVoiceSound(_voiceSoundName:String, loops:int = 1):void{
//			if(SoundManager.soundMuted)
//				return;
			if(!sharedObjectService.sound){
				return;
			}
			var url:String = MEDIA_PATH+_voiceSoundName+".mp3";
			if(currentSoundChannel)
				currentSoundChannel.stop();
			
			currentSoundChannel = laya.media.SoundManager.playSound(url,loops);
		}
		
		
		private var __bgSoundNameArr:Array;
		private var __bgSoundIndex:int;
		/**
		 * 播放背景音乐 
		 * 
		 */		
		public function playBgMusic(_bgSoundNameArr:Array, _randomPlayBol:Boolean = true):void
		{			
			//			if(__bgSoundchannel && !__bgSoundchannel.isStopped)
			//				return;
			
			__bgSoundNameArr = _bgSoundNameArr;
			__bgSoundIndex = 0;
			SoundManager.setMusicVolume(0.3);
			playOneBgMusic();
		}
		
		private var __bgSoundchannel:laya.media.SoundChannel;
		private function playOneBgMusic():void
		{
			//如果禁止了背景音乐，不播放
			if(SoundManager.musicMuted)
				return;
			if(!__bgSoundNameArr)
				return;
			
			var soundName:String = MEDIA_PATH +__bgSoundNameArr[__bgSoundIndex]+".mp3";
			
			__bgSoundchannel = SoundManager.playMusic(soundName,1, Handler.create(this,playBgSoundComplete));
		}
		
		/**
		 * 播放背景音乐完毕 
		 * @param e
		 * 
		 */		
		private function playBgSoundComplete():void
		{
			__bgSoundIndex++;
			if(__bgSoundIndex == __bgSoundNameArr.length)
				__bgSoundIndex = 0;
			
			playOneBgMusic();
		}
		
		/**
		 * 停止持续音效 
		 * 
		 */		
		public function stopLastVoice():void
		{
			if(currentSoundChannel)
			{
				currentSoundChannel.stop();
				currentSoundChannel = null;
			}
		}
		
		/**
		 * 暂停背景音乐 
		 * 
		 */		
		public function pauseBgMusic():void
		{
			if(SoundManager.musicMuted)
				return;
			
			__pausePosition = __bgSoundchannel.position;
			__bgSoundchannel.stop();
		}
		
		/**
		 * 暂停后开始播 
		 * 
		 */		
		public function replay():void
		{
			if(SoundManager.musicMuted)
				return;
			
			if(!__pausePosition) __pausePosition = __bgSoundchannel.position;
			
			var soundName:String = __bgSoundNameArr[__bgSoundIndex];
			
			var url:String = MEDIA_PATH+soundName+".mp3";
			
			__bgSoundchannel = laya.media.SoundManager.playMusic(url, 1, Handler.create(this,playBgSoundComplete), __pausePosition)//__sound.play(__pausePosition);
		}
		
		
		
		/**
		 * 停止播放音乐
		 * 
		 */		
		private function stopBgMusic():void
		{
			if(__bgSoundchannel)
				__bgSoundchannel.stop();
			
			stopLastVoice();
		}
	}
}