package msg
{

	import com.IProtobuf.Builder
	import laya.utils.Browser
	public class msg_cs
	{
		private var ProtoBuf:* = Browser.window.dcodeIO.ProtoBuf
		private var builder:*
		public function loadProtoFile(protoPath:String):void{
			builder = ProtoBuf.loadProtoFile(protoPath)
		}
		public function ConnHead_Builer():Builder{
			return builder.build("msg")["ConnHead"];
		};
		public function getConnHead():ConnHead{
			var clazz:* = builder.build("msg")["ConnHead"];
			return new clazz();
		};
		public function ENError_Builer():Builder{
			return builder.build("msg")["ENError"];
		};
		public function getENError():ENError{
			var clazz:* = builder.build("msg")["ENError"];
			return new clazz();
		};
		public function LoginReq_Builer():Builder{
			return builder.build("msg")["LoginReq"];
		};
		public function getLoginReq():LoginReq{
			var clazz:* = builder.build("msg")["LoginReq"];
			return new clazz();
		};
		public function LoginRsp_Builer():Builder{
			return builder.build("msg")["LoginRsp"];
		};
		public function getLoginRsp():LoginRsp{
			var clazz:* = builder.build("msg")["LoginRsp"];
			return new clazz();
		};
		public function ReturnHallReq_Builer():Builder{
			return builder.build("msg")["ReturnHallReq"];
		};
		public function getReturnHallReq():ReturnHallReq{
			var clazz:* = builder.build("msg")["ReturnHallReq"];
			return new clazz();
		};
		public function ReturnHallRsp_Builer():Builder{
			return builder.build("msg")["ReturnHallRsp"];
		};
		public function getReturnHallRsp():ReturnHallRsp{
			var clazz:* = builder.build("msg")["ReturnHallRsp"];
			return new clazz();
		};
		public function HeartBeatReq_Builer():Builder{
			return builder.build("msg")["HeartBeatReq"];
		};
		public function getHeartBeatReq():HeartBeatReq{
			var clazz:* = builder.build("msg")["HeartBeatReq"];
			return new clazz();
		};
		public function HeartBeatRsp_Builer():Builder{
			return builder.build("msg")["HeartBeatRsp"];
		};
		public function getHeartBeatRsp():HeartBeatRsp{
			var clazz:* = builder.build("msg")["HeartBeatRsp"];
			return new clazz();
		};
		public function TimeSyncReq_Builer():Builder{
			return builder.build("msg")["TimeSyncReq"];
		};
		public function getTimeSyncReq():TimeSyncReq{
			var clazz:* = builder.build("msg")["TimeSyncReq"];
			return new clazz();
		};
		public function TimeSyncRsp_Builer():Builder{
			return builder.build("msg")["TimeSyncRsp"];
		};
		public function getTimeSyncRsp():TimeSyncRsp{
			var clazz:* = builder.build("msg")["TimeSyncRsp"];
			return new clazz();
		};
		public function ENConnOperationType_Builer():Builder{
			return builder.build("msg")["ENConnOperationType"];
		};
		public function getENConnOperationType():ENConnOperationType{
			var clazz:* = builder.build("msg")["ENConnOperationType"];
			return new clazz();
		};
		public function ConnOperationNotify_Builer():Builder{
			return builder.build("msg")["ConnOperationNotify"];
		};
		public function getConnOperationNotify():ConnOperationNotify{
			var clazz:* = builder.build("msg")["ConnOperationNotify"];
			return new clazz();
		};
		public function CS_Table_Builer():Builder{
			return builder.build("msg")["CS_Table"];
		};
		public function getCS_Table():CS_Table{
			var clazz:* = builder.build("msg")["CS_Table"];
			return new clazz();
		};
		public function CS_Lang_Builer():Builder{
			return builder.build("msg")["CS_Lang"];
		};
		public function getCS_Lang():CS_Lang{
			var clazz:* = builder.build("msg")["CS_Lang"];
			return new clazz();
		};
		public function GetLangListReq_Builer():Builder{
			return builder.build("msg")["GetLangListReq"];
		};
		public function getGetLangListReq():GetLangListReq{
			var clazz:* = builder.build("msg")["GetLangListReq"];
			return new clazz();
		};
		public function GetLangListRsp_Builer():Builder{
			return builder.build("msg")["GetLangListRsp"];
		};
		public function getGetLangListRsp():GetLangListRsp{
			var clazz:* = builder.build("msg")["GetLangListRsp"];
			return new clazz();
		};
		public function GetTableListReq_Builer():Builder{
			return builder.build("msg")["GetTableListReq"];
		};
		public function getGetTableListReq():GetTableListReq{
			var clazz:* = builder.build("msg")["GetTableListReq"];
			return new clazz();
		};
		public function GetTableListRsp_Builer():Builder{
			return builder.build("msg")["GetTableListRsp"];
		};
		public function getGetTableListRsp():GetTableListRsp{
			var clazz:* = builder.build("msg")["GetTableListRsp"];
			return new clazz();
		};
		public function EnterTableReq_Builer():Builder{
			return builder.build("msg")["EnterTableReq"];
		};
		public function getEnterTableReq():EnterTableReq{
			var clazz:* = builder.build("msg")["EnterTableReq"];
			return new clazz();
		};
		public function EnterTableRsp_Builer():Builder{
			return builder.build("msg")["EnterTableRsp"];
		};
		public function getEnterTableRsp():EnterTableRsp{
			var clazz:* = builder.build("msg")["EnterTableRsp"];
			return new clazz();
		};
		public function TableCloseNotify_Builer():Builder{
			return builder.build("msg")["TableCloseNotify"];
		};
		public function getTableCloseNotify():TableCloseNotify{
			var clazz:* = builder.build("msg")["TableCloseNotify"];
			return new clazz();
		};
		public function SelfKickNotify_Builer():Builder{
			return builder.build("msg")["SelfKickNotify"];
		};
		public function getSelfKickNotify():SelfKickNotify{
			var clazz:* = builder.build("msg")["SelfKickNotify"];
			return new clazz();
		};
		public function NoticeInfo_Builer():Builder{
			return builder.build("msg")["NoticeInfo"];
		};
		public function getNoticeInfo():NoticeInfo{
			var clazz:* = builder.build("msg")["NoticeInfo"];
			return new clazz();
		};
		public function PushNoticeNotify_Builer():Builder{
			return builder.build("msg")["PushNoticeNotify"];
		};
		public function getPushNoticeNotify():PushNoticeNotify{
			var clazz:* = builder.build("msg")["PushNoticeNotify"];
			return new clazz();
		};
		public function ENKickReason_Builer():Builder{
			return builder.build("msg")["ENKickReason"];
		};
		public function getENKickReason():ENKickReason{
			var clazz:* = builder.build("msg")["ENKickReason"];
			return new clazz();
		};
		public function KickPlayerNotify_Builer():Builder{
			return builder.build("msg")["KickPlayerNotify"];
		};
		public function getKickPlayerNotify():KickPlayerNotify{
			var clazz:* = builder.build("msg")["KickPlayerNotify"];
			return new clazz();
		};
		public function CarryInReq_Builer():Builder{
			return builder.build("msg")["CarryInReq"];
		};
		public function getCarryInReq():CarryInReq{
			var clazz:* = builder.build("msg")["CarryInReq"];
			return new clazz();
		};
		public function CarryInRsp_Builer():Builder{
			return builder.build("msg")["CarryInRsp"];
		};
		public function getCarryInRsp():CarryInRsp{
			var clazz:* = builder.build("msg")["CarryInRsp"];
			return new clazz();
		};
		public function RoundInfo_Builer():Builder{
			return builder.build("msg")["RoundInfo"];
		};
		public function getRoundInfo():RoundInfo{
			var clazz:* = builder.build("msg")["RoundInfo"];
			return new clazz();
		};
		public function RoundStartNotify_Builer():Builder{
			return builder.build("msg")["RoundStartNotify"];
		};
		public function getRoundStartNotify():RoundStartNotify{
			var clazz:* = builder.build("msg")["RoundStartNotify"];
			return new clazz();
		};
		public function RoundCommitNotify_Builer():Builder{
			return builder.build("msg")["RoundCommitNotify"];
		};
		public function getRoundCommitNotify():RoundCommitNotify{
			var clazz:* = builder.build("msg")["RoundCommitNotify"];
			return new clazz();
		};
		public function PlayerResult_Builer():Builder{
			return builder.build("msg")["PlayerResult"];
		};
		public function getPlayerResult():PlayerResult{
			var clazz:* = builder.build("msg")["PlayerResult"];
			return new clazz();
		};
		public function RoundResult_Builer():Builder{
			return builder.build("msg")["RoundResult"];
		};
		public function getRoundResult():RoundResult{
			var clazz:* = builder.build("msg")["RoundResult"];
			return new clazz();
		};
		public function RoundResultNotify_Builer():Builder{
			return builder.build("msg")["RoundResultNotify"];
		};
		public function getRoundResultNotify():RoundResultNotify{
			var clazz:* = builder.build("msg")["RoundResultNotify"];
			return new clazz();
		};
		public function TableInfoNotify_Builer():Builder{
			return builder.build("msg")["TableInfoNotify"];
		};
		public function getTableInfoNotify():TableInfoNotify{
			var clazz:* = builder.build("msg")["TableInfoNotify"];
			return new clazz();
		};
		public function PlayerBetReq_Builer():Builder{
			return builder.build("msg")["PlayerBetReq"];
		};
		public function getPlayerBetReq():PlayerBetReq{
			var clazz:* = builder.build("msg")["PlayerBetReq"];
			return new clazz();
		};
		public function PlayerBetRsp_Builer():Builder{
			return builder.build("msg")["PlayerBetRsp"];
		};
		public function getPlayerBetRsp():PlayerBetRsp{
			var clazz:* = builder.build("msg")["PlayerBetRsp"];
			return new clazz();
		};
		public function PlayerMaxBetReq_Builer():Builder{
			return builder.build("msg")["PlayerMaxBetReq"];
		};
		public function getPlayerMaxBetReq():PlayerMaxBetReq{
			var clazz:* = builder.build("msg")["PlayerMaxBetReq"];
			return new clazz();
		};
		public function PlayerMaxBetRsp_Builer():Builder{
			return builder.build("msg")["PlayerMaxBetRsp"];
		};
		public function getPlayerMaxBetRsp():PlayerMaxBetRsp{
			var clazz:* = builder.build("msg")["PlayerMaxBetRsp"];
			return new clazz();
		};
		public function PlayerSavedBetReq_Builer():Builder{
			return builder.build("msg")["PlayerSavedBetReq"];
		};
		public function getPlayerSavedBetReq():PlayerSavedBetReq{
			var clazz:* = builder.build("msg")["PlayerSavedBetReq"];
			return new clazz();
		};
		public function PlayerSavedBetRsp_Builer():Builder{
			return builder.build("msg")["PlayerSavedBetRsp"];
		};
		public function getPlayerSavedBetRsp():PlayerSavedBetRsp{
			var clazz:* = builder.build("msg")["PlayerSavedBetRsp"];
			return new clazz();
		};
		public function PlayerCancelBetReq_Builer():Builder{
			return builder.build("msg")["PlayerCancelBetReq"];
		};
		public function getPlayerCancelBetReq():PlayerCancelBetReq{
			var clazz:* = builder.build("msg")["PlayerCancelBetReq"];
			return new clazz();
		};
		public function PlayerCancelBetRsp_Builer():Builder{
			return builder.build("msg")["PlayerCancelBetRsp"];
		};
		public function getPlayerCancelBetRsp():PlayerCancelBetRsp{
			var clazz:* = builder.build("msg")["PlayerCancelBetRsp"];
			return new clazz();
		};
		public function RoundSumBetsNotify_Builer():Builder{
			return builder.build("msg")["RoundSumBetsNotify"];
		};
		public function getRoundSumBetsNotify():RoundSumBetsNotify{
			var clazz:* = builder.build("msg")["RoundSumBetsNotify"];
			return new clazz();
		};
		public function ServerStartNotify_Builer():Builder{
			return builder.build("msg")["ServerStartNotify"];
		};
		public function getServerStartNotify():ServerStartNotify{
			var clazz:* = builder.build("msg")["ServerStartNotify"];
			return new clazz();
		};
		public function ServerCloseNotify_Builer():Builder{
			return builder.build("msg")["ServerCloseNotify"];
		};
		public function getServerCloseNotify():ServerCloseNotify{
			var clazz:* = builder.build("msg")["ServerCloseNotify"];
			return new clazz();
		};
		public function PlayerEnterNotify_Builer():Builder{
			return builder.build("msg")["PlayerEnterNotify"];
		};
		public function getPlayerEnterNotify():PlayerEnterNotify{
			var clazz:* = builder.build("msg")["PlayerEnterNotify"];
			return new clazz();
		};
		public function PlayerLeaveNotify_Builer():Builder{
			return builder.build("msg")["PlayerLeaveNotify"];
		};
		public function getPlayerLeaveNotify():PlayerLeaveNotify{
			var clazz:* = builder.build("msg")["PlayerLeaveNotify"];
			return new clazz();
		};
		public function GetPlayerEnterStateReq_Builer():Builder{
			return builder.build("msg")["GetPlayerEnterStateReq"];
		};
		public function getGetPlayerEnterStateReq():GetPlayerEnterStateReq{
			var clazz:* = builder.build("msg")["GetPlayerEnterStateReq"];
			return new clazz();
		};
		public function GetPlayerEnterStateRsp_Builer():Builder{
			return builder.build("msg")["GetPlayerEnterStateRsp"];
		};
		public function getGetPlayerEnterStateRsp():GetPlayerEnterStateRsp{
			var clazz:* = builder.build("msg")["GetPlayerEnterStateRsp"];
			return new clazz();
		};
		public function LevelTestReq_Builer():Builder{
			return builder.build("msg")["LevelTestReq"];
		};
		public function getLevelTestReq():LevelTestReq{
			var clazz:* = builder.build("msg")["LevelTestReq"];
			return new clazz();
		};
		public function LevelTestRsp_Builer():Builder{
			return builder.build("msg")["LevelTestRsp"];
		};
		public function getLevelTestRsp():LevelTestRsp{
			var clazz:* = builder.build("msg")["LevelTestRsp"];
			return new clazz();
		};
		public function TabelHistroy_Builer():Builder{
			return builder.build("msg")["TabelHistroy"];
		};
		public function getTabelHistroy():TabelHistroy{
			var clazz:* = builder.build("msg")["TabelHistroy"];
			return new clazz();
		};
		public function ConstumPoker_Builer():Builder{
			return builder.build("msg")["ConstumPoker"];
		};
		public function getConstumPoker():ConstumPoker{
			var clazz:* = builder.build("msg")["ConstumPoker"];
			return new clazz();
		};
		public function ENCSType_Builer():Builder{
			return builder.build("msg")["ENCSType"];
		};
		public function getENCSType():ENCSType{
			var clazz:* = builder.build("msg")["ENCSType"];
			return new clazz();
		};
		public function CS_Builer():Builder{
			return builder.build("msg")["CS"];
		};
		public function getCS():CS{
			var clazz:* = builder.build("msg")["CS"];
			return new clazz();
		};
	}
}
