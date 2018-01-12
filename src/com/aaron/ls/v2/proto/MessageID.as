package com.aaron.ls.v2.proto
{
	public class MessageID
	{
		public static const HEART_BEAT_REQIEST:int = 1;
		public static const HEART_BEAT_RESPONSE:int = 2;
		public static const LOGIN_REQUEST:int = 3;
		public static const LOGIN_RESPONSE:int = 4;
		public static const RECONNECTION_FAILURE_NOTIFY:int = 28;
		public static const HANDSHAKE_REQUEST:int = 26;
		public static const HANDSHAKE_RESPONSE:int = 27;
		public static const JOIN_ROOM_REQUEST:int = 5;
		public static const JOIN_ROOM_RESPONSE:int = 6;
		public static const JOIN_ROOM_NOTIFY:int = 7;
		public static const LEAVE_ROOM_REQUEST:int = 8;
		public static const LEAVE_ROOM_RESPONSE:int = 9;
		public static const LEAVE_ROOM_NOTIFY:int = 10;
		public static const GET_ROOM_LIST_REQUEST:int = 11;
		public static const GET_ROOM_LIST_RESPONSE:int = 12;
		public static const LOGOUT_REQUEST:int = 13;
		public static const LOGOUT_RESPONSE:int = 14;
		public static const SET_ROOM_VARIABLE_REQUEST:int = 15;
		public static const SET_ROOM_VARIABLE_RESPONSE:int = 16;
		public static const SET_ROOM_VARIABLE_NOTIFY:int = 17;
		public static const SET_USER_VARIABLE_REQUEST:int = 18;
		public static const SET_USER_VARIABLE_RESPONSE:int = 19;
		public static const SET_USER_VARIABLE_NOTIFY:int = 20;
		public static const GENERIC_MESSAGE_REQUEST:int = 21;
		public static const GENERIC_MESSAGE_RESPONSE:int = 22;
		public static const GENERIC_MESSAGE_NOTIFY:int = 23;
		public static const PUBLIC_MESSAGE:int = 24;
		public static const PRIVATE_MESSAGE:int = 25;
		public static const CLIENT_DISCONNECTION_NOTIFY:int = 29;
		public static const CREATE_ROOM_REQUEST:int = 30;
		public static const CREATE_ROOM_RESPONSE:int = 31;
		public static const ROOM_ADDED_NOTIFY:int = 32;
		public static const EXTENSION_CONTROLLER:int = 100;
	}
}
