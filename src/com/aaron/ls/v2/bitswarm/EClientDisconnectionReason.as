package com.aaron.ls.v2.bitswarm
{

	public class EClientDisconnectionReason {
		
		public static const IDLE:String = "idle";
		public static const KICK:String = "kick";
		public static const BAN:String = "ban";
		public static const MANUAL:String = "manual";
		public static const UNKNOWN:String = "unknown";
		
		private static var reasons:Array = ["idle", "kick", "ban"];
		
		public static function getReason(reasonId:int):String{
			return (reasons[reasonId]);
		}
		
	}
}