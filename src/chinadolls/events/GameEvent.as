package chinadolls.events
{
	import com.iflash.events.Event;
	
	public class GameEvent extends Event
	{
		public static const BET_CLICK:String = "betClick";
		public static const USERINFO_CHANGE:String = "userInfoChangeEvent";
		public static const SHOW_RECONNECT_VIEW:String = "showReconnectView";
		public static const HIDE_RECONNECT_VIEW:String = "hideReconnectView";
		public static const CHANGE_SOUND_EVENT:String = "changeSoundEvent";
		
		public static const START_SLOT:String = "startSlot";
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}