package com.aaron.ls.v2.proto
{
	public class ErrorCode
	{
		public static const WRONG_VERSION:int = 1;
		public static const LOGIN_BAD_ZONENAME:int = 2;
		public static const UNKNOWN_ERROR:int = 3;
		public static const USER_IS_NOT_LOGIN:int = 4;
		public static const USER_IS_MARKED_FOR_KICKING:int = 5;
		public static const INSUFFICIENT_PRIVILEGES_REQUEST:int = 6;
		public static const REQUESTED_ROOM_DOES_NOT_EXIST:int = 7;
		public static const LOGIN_ALREADY_LOGGED:int = 8;
		public static const JOIN_ALREADY_DOINNING:int = 9;
		public static const JOIN_ALREADY_JOINED:int = 10;
		public static const JOIN_ROOM_FULL:int = 11;
		public static const JOIN_BAD_ROOM:int = 12;
		public static const JOIN_BAD_PASSWORD:int = 13;
		public static const JOIN_ROOM_LOCKED:int = 14;
		public static const CREATE_ROOM_ZONE_FULL:int = 15;
		public static const ROOM_DUPLICATE_NAME:int = 16;
		public static const ROOM_NAME_BAD_SIZE:int = 17;
		public static const CREATE_ROOM_LINIT_FULL:int = 22;
		public static const SWITCH_NOT_A_GAME_ROOM:int = 18;
		public static const SWITCH_NOT_JOINED_IN_ROOM:int = 19;
		public static const SWITCH_NO_SPECTATOR_SLOTS_AVAILABLE:int = 20;
		public static const SWITCH_NO_PLAYER_SLOTS_AVAILABLE:int = 21;
	}
}
