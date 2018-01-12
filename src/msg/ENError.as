package msg
{
	public class ENError
	{
		public static const ERROR_OK:int = 0;
		public static const ERROR_INVALID_TABLE_ID:int = 2;
		public static const ERROR_INVALID_CONN_ID:int = 3;
		public static const ERROR_INVALID_UID:int = 6;
		public static const ERROR_INVALID_VERIFY_SIG:int = 10;
		public static const ERROR_INVALID_CARRY_IN_TYPE:int = 12;
		public static const ERROR_ALREADY_IN_OTHER_TABLE:int = 23;
		public static const ERROR_SERVER_STOPPING:int = 58;
		public static const ERROR_SERVER_STOPPED:int = 62;
		public static const ERROR_ROOMSVR_NEEDCLOSE:int = 100;
		public static const ERROR_ROOMSVR_FULL:int = 101;
		public static const ERROR_GAMESVR_ENTER_PLAYERSTATEWRONG:int = 200;
		public static const ERROR_GAMESVR_ENTER_ALREADYHAVE:int = 201;
		public static const ERROR_GAMESVR_HASNOT_ENTER:int = 202;
		public static const ERROR_GAMESVR_CARRYINING:int = 203;
		public static const ERROR_GAMESVR_UNKNOWN_PLAYERSTATE:int = 204;
		public static const ERROR_GAMESVR_CARRY_IN_FAILED:int = 205;
		public static const ERROR_GAMESVR_UNKNOWN_ROUND_ID:int = 206;
		public static const ERROR_GAMESVR_WRONG_CURRENCY:int = 207;
		public static const ERROR_GAMESVR_LOW_BALANCE:int = 208;
		public static const ERROR_GAMESVR_BELOW_MIN_BET:int = 209;
		public static const ERROR_GAMESVR_OVER_MAX_BET:int = 210;
		public static const ERROR_GAMESVR_UNKNOWN_BETITEM_ID:int = 211;
		public static const ERROR_GAMESVR_NO_SAVED_BET:int = 212;
		public static const ERROR_GAMESVR_WRONG_ROUND_STATE:int = 213;
		public static const ERROR_GAMESVR_ALREADY_BETED:int = 214;
		public static const ERROR_GAMESVR_INVALID_CURRENCY:int = 215;
		public static const ERROR_GAMESVR_ENTER_RECONNECTED:int = 251;
		public static const ERROR_DBSVR_QUERY:int = 500;
		public static const ERROR_DBSVR_UPDATE:int = 501;
		public static const ERROR_DBSVR_DELETE:int = 502;
		public static const ERROR_DBSVR_INSERT:int = 503;
		public static const ERROR_DBSVR_QUERY_TIMEOUT:int = 504;
		public static const ERROR_DBSVR_UPDATE_TIMEOUT:int = 505;
		public static const ERROR_DBSVR_DELETE_TIMEOUT:int = 506;
		public static const ERROR_DBSVR_INSERT_TIMEOUT:int = 507;
		public static const ERROR_DBSVR_PARSE:int = 508;
		public static const ERROR_DBSVR_PACK:int = 509;
		public static const ERROR_ROOMSVR:int = 510;
		public static const ERROR_ROOMSVR_TIMEOUT:int = 511;
		public static const ERROR_HTTPSVR:int = 512;
		public static const ERROR_HTTPSVR_TIMEOUT:int = 513;
		public static const ERROR_MATCHSVR_TIMEOUT:int = 514;
		public static const ERROR_CONFSVR_TIMEOUT:int = 515;
		public static const ERROR_RISKSVR:int = 516;
		public static const ERROR_RISKSVR_TIMEOUT:int = 517;
	}
}
