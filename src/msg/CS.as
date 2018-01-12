package msg
{
	import com.IProtobuf.Message;
	import conf.PokerInfo;

	public class CS extends Message
	{

		public var msg_type:int = 1;
		public var conn_head:ConnHead = null;
		public var heart_beat_req:HeartBeatReq = null;
		public var heart_beat_rsp:HeartBeatRsp = null;
		public var conn_operation_notify:ConnOperationNotify = null;
		public var time_sync_req:TimeSyncReq = null;
		public var time_sync_rsp:TimeSyncRsp = null;
		public var login_req:LoginReq = null;
		public var login_rsp:LoginRsp = null;
		public var enter_table_req:EnterTableReq = null;
		public var enter_table_rsp:EnterTableRsp = null;
		public var get_table_list_req:GetTableListReq = null;
		public var get_table_list_rsp:GetTableListRsp = null;
		public var carry_in_req:CarryInReq = null;
		public var carry_in_rsp:CarryInRsp = null;
		public var player_bet_req:PlayerBetReq = null;
		public var player_bet_rsp:PlayerBetRsp = null;
		public var player_max_bet_req:PlayerMaxBetReq = null;
		public var player_max_bet_rsp:PlayerMaxBetRsp = null;
		public var player_saved_bet_req:PlayerSavedBetReq = null;
		public var player_saved_bet_rsp:PlayerSavedBetRsp = null;
		public var player_cancel_bet_req:PlayerCancelBetReq = null;
		public var player_cancel_bet_rsp:PlayerCancelBetRsp = null;
		public var table_info_notify:TableInfoNotify = null;
		public var round_sum_bets_notify:RoundSumBetsNotify = null;
		public var round_start_notify:RoundStartNotify = null;
		public var round_commit_notify:RoundCommitNotify = null;
		public var round_cash_notify:RoundResultNotify = null;
		public var table_close_notify:TableCloseNotify = null;
		public var self_kick_notify:SelfKickNotify = null;
		public var server_start_notify:ServerStartNotify = null;
		public var server_close_notify:ServerCloseNotify = null;
		public var player_enter_notify:PlayerEnterNotify = null;
		public var player_leave_notify:PlayerLeaveNotify = null;
		public var get_player_enter_state_req:GetPlayerEnterStateReq = null;
		public var get_player_enter_state_rsp:GetPlayerEnterStateRsp = null;
		public var push_notice_notify:PushNoticeNotify = null;
		public var kick_player_notify:KickPlayerNotify = null;
		public var return_hall_req:ReturnHallReq = null;
		public var return_hall_rsp:ReturnHallRsp = null;
		public var get_lang_req:GetLangListReq = null;
		public var get_lang_rsp:GetLangListRsp = null;
		public var FirstPokerInfo:conf.PokerInfo = null;
		public var OtherPokerInfo:conf.PokerInfo = null;
		public var tabelhistroy:TabelHistroy = null;
		public var constumpoker:ConstumPoker = null;
		public var test_level_req:LevelTestReq = null;
		public var test_level_rsp:LevelTestRsp = null;
		public var client_tag:String = "9999";
		public function writeTo(value:*):void{
		}
	}
}
