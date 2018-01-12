package chinadolls.service
{
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.parrerns.Model;
	import com.lightUI.logging.Log;
	
	import chinadolls.model.MySoundManager;

	
	import laya.media.SoundManager;
	import laya.net.LocalStorage;
	
	public class SharedObjectService extends Model implements IModel
	{
		public static var NAME:String = "sharedObjectService";
		
		private var _uidAndAppId:String;
		private var _data:MusicVo = null;
		public function SharedObjectService(modelName:String=null, data:Object=null)
		{
			if(!_data)
				_data = new MusicVo();
			super(modelName,data);
		}
		
		override public function getInjector():Array{
			return [];
		}
		
		public function init(uidAndAppId:String):void
		{
			_uidAndAppId = uidAndAppId;
			_data = LocalStorage.getJSON(uidAndAppId) as MusicVo;
			if( _data == null ){
				_data = new MusicVo(); //取默认
				_data.isOpenMusic = true;
				_data.isOpenSound = true;
			}
			SoundManager.autoStopMusic = false;
			
			MySoundManager.getInstance().musicOnBol= music;
			MySoundManager.getInstance().voiceOnBol = sound;
			
			//			if(sound)
			//				SoundManager.stopAll();
			Log.debug("初始化音乐开关：music:",(_data.isOpenMusic?"开":"关")," sound:",_data.isOpenSound?"开":"关");
		}
		
		public function get music():Boolean
		{
			return _data.isOpenMusic;
		}
		
		public function get sound():Boolean
		{
			return _data.isOpenSound;
		}
		
		/**
		 * 设置音乐音效 
		 * @param m 背景音乐是否开启
		 * @param s 音效是否开启
		 */		
		public function setMusic( m:Boolean ):void
		{
			//			if(m == _data.isOpenMusic) return;
			_data.isOpenMusic = m;
			SoundManager.musicMuted = !m;
			Log.debug("setMusic 设置音乐开关：music:",(_data.isOpenMusic?"开":"关")," sound:",_data.isOpenSound?"开":"关");
			if( _uidAndAppId != "" )
				LocalStorage.setJSON(_uidAndAppId,_data);
		}
		public function setSound( s:Boolean ):void
		{
			//			if(s == _data.isOpenSound) return;
			_data.isOpenSound = s;
			SoundManager.soundMuted = !s;
			if( s )
				SoundManager.stopAllSound();
			Log.debug("setSound 设置音乐开关：music:",(_data.isOpenMusic?"开":"关")," sound:",_data.isOpenSound?"开":"关");
			if( _uidAndAppId != "" )
				LocalStorage.setJSON(_uidAndAppId,_data);
		}
		
	}
	
	
}



class MusicVo
{
	public var isOpenMusic:Boolean;
	public var isOpenSound:Boolean;
	function MusicVo(){
		isOpenMusic = false;
		isOpenSound = false;
	}
}