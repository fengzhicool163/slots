package msg
{

	import com.IProtobuf.Builder
	import laya.utils.Browser
	public class conf_game
	{
		private var ProtoBuf:* = Browser.window.dcodeIO.ProtoBuf
		private var builder:*
		public function loadProtoFile(protoPath:String):void{
			builder = ProtoBuf.loadProtoFile(protoPath)
		}
		public function ENPlatformType_Builer():Builder{
			return builder.build("msg")["ENPlatformType"];
		};
		public function getENPlatformType():ENPlatformType{
			var clazz:* = builder.build("msg")["ENPlatformType"];
			return new clazz();
		};
		public function Scope_Builer():Builder{
			return builder.build("msg")["Scope"];
		};
		public function getScope():Scope{
			var clazz:* = builder.build("msg")["Scope"];
			return new clazz();
		};
		public function Scope64_Builer():Builder{
			return builder.build("msg")["Scope64"];
		};
		public function getScope64():Scope64{
			var clazz:* = builder.build("msg")["Scope64"];
			return new clazz();
		};
		public function ENMoneyType_Builer():Builder{
			return builder.build("msg")["ENMoneyType"];
		};
		public function getENMoneyType():ENMoneyType{
			var clazz:* = builder.build("msg")["ENMoneyType"];
			return new clazz();
		};
		public function Money_Builer():Builder{
			return builder.build("msg")["Money"];
		};
		public function getMoney():Money{
			var clazz:* = builder.build("msg")["Money"];
			return new clazz();
		};
		public function Currency_Builer():Builder{
			return builder.build("msg")["Currency"];
		};
		public function getCurrency():Currency{
			var clazz:* = builder.build("msg")["Currency"];
			return new clazz();
		};
		public function Prop_Builer():Builder{
			return builder.build("msg")["Prop"];
		};
		public function getProp():Prop{
			var clazz:* = builder.build("msg")["Prop"];
			return new clazz();
		};
		public function Integer2DTable_Builer():Builder{
			return builder.build("msg")["Integer2DTable"];
		};
		public function getInteger2DTable():Integer2DTable{
			var clazz:* = builder.build("msg")["Integer2DTable"];
			return new clazz();
		};
		public function String2DTable_Builer():Builder{
			return builder.build("msg")["String2DTable"];
		};
		public function getString2DTable():String2DTable{
			var clazz:* = builder.build("msg")["String2DTable"];
			return new clazz();
		};
		public function Double2DTable_Builer():Builder{
			return builder.build("msg")["Double2DTable"];
		};
		public function getDouble2DTable():Double2DTable{
			var clazz:* = builder.build("msg")["Double2DTable"];
			return new clazz();
		};
		public function Risk_Builer():Builder{
			return builder.build("msg")["Risk"];
		};
		public function getRisk():Risk{
			var clazz:* = builder.build("msg")["Risk"];
			return new clazz();
		};
		public function ENRoundState_Builer():Builder{
			return builder.build("msg")["ENRoundState"];
		};
		public function getENRoundState():ENRoundState{
			var clazz:* = builder.build("msg")["ENRoundState"];
			return new clazz();
		};
		public function ENTableState_Builer():Builder{
			return builder.build("msg")["ENTableState"];
		};
		public function getENTableState():ENTableState{
			var clazz:* = builder.build("msg")["ENTableState"];
			return new clazz();
		};
		public function ENTableType_Builer():Builder{
			return builder.build("msg")["ENTableType"];
		};
		public function getENTableType():ENTableType{
			var clazz:* = builder.build("msg")["ENTableType"];
			return new clazz();
		};
		public function Table_Builer():Builder{
			return builder.build("msg")["Table"];
		};
		public function getTable():Table{
			var clazz:* = builder.build("msg")["Table"];
			return new clazz();
		};
		public function ENPlayerState_Builer():Builder{
			return builder.build("msg")["ENPlayerState"];
		};
		public function getENPlayerState():ENPlayerState{
			var clazz:* = builder.build("msg")["ENPlayerState"];
			return new clazz();
		};
		public function PlayerBet_Builer():Builder{
			return builder.build("msg")["PlayerBet"];
		};
		public function getPlayerBet():PlayerBet{
			var clazz:* = builder.build("msg")["PlayerBet"];
			return new clazz();
		};
		public function BetInfo_Builer():Builder{
			return builder.build("msg")["BetInfo"];
		};
		public function getBetInfo():BetInfo{
			var clazz:* = builder.build("msg")["BetInfo"];
			return new clazz();
		};
		public function PokerInfo_Builer():Builder{
			return builder.build("msg")["PokerInfo"];
		};
		public function getPokerInfo():PokerInfo{
			var clazz:* = builder.build("msg")["PokerInfo"];
			return new clazz();
		};
		public function TexasPokerResultType_Builer():Builder{
			return builder.build("msg")["TexasPokerResultType"];
		};
		public function getTexasPokerResultType():TexasPokerResultType{
			var clazz:* = builder.build("msg")["TexasPokerResultType"];
			return new clazz();
		};
		public function ENBetType_Builer():Builder{
			return builder.build("msg")["ENBetType"];
		};
		public function getENBetType():ENBetType{
			var clazz:* = builder.build("msg")["ENBetType"];
			return new clazz();
		};
		public function BetItem_Builer():Builder{
			return builder.build("msg")["BetItem"];
		};
		public function getBetItem():BetItem{
			var clazz:* = builder.build("msg")["BetItem"];
			return new clazz();
		};
		public function BetLocation_Builer():Builder{
			return builder.build("msg")["BetLocation"];
		};
		public function getBetLocation():BetLocation{
			var clazz:* = builder.build("msg")["BetLocation"];
			return new clazz();
		};
		public function ChanceCoin_Builer():Builder{
			return builder.build("msg")["ChanceCoin"];
		};
		public function getChanceCoin():ChanceCoin{
			var clazz:* = builder.build("msg")["ChanceCoin"];
			return new clazz();
		};
		public function ChanceCash_Builer():Builder{
			return builder.build("msg")["ChanceCash"];
		};
		public function getChanceCash():ChanceCash{
			var clazz:* = builder.build("msg")["ChanceCash"];
			return new clazz();
		};
		public function HitSts_Builer():Builder{
			return builder.build("msg")["HitSts"];
		};
		public function getHitSts():HitSts{
			var clazz:* = builder.build("msg")["HitSts"];
			return new clazz();
		};
		public function lotteryConfig_Builer():Builder{
			return builder.build("msg")["lotteryConfig"];
		};
		public function getlotteryConfig():lotteryConfig{
			var clazz:* = builder.build("msg")["lotteryConfig"];
			return new clazz();
		};
		public function DirtyWord_Builer():Builder{
			return builder.build("msg")["DirtyWord"];
		};
		public function getDirtyWord():DirtyWord{
			var clazz:* = builder.build("msg")["DirtyWord"];
			return new clazz();
		};
		public function ENNoticeType_Builer():Builder{
			return builder.build("msg")["ENNoticeType"];
		};
		public function getENNoticeType():ENNoticeType{
			var clazz:* = builder.build("msg")["ENNoticeType"];
			return new clazz();
		};
		public function ENNoticeLocation_Builer():Builder{
			return builder.build("msg")["ENNoticeLocation"];
		};
		public function getENNoticeLocation():ENNoticeLocation{
			var clazz:* = builder.build("msg")["ENNoticeLocation"];
			return new clazz();
		};
		public function Notice_Builer():Builder{
			return builder.build("msg")["Notice"];
		};
		public function getNotice():Notice{
			var clazz:* = builder.build("msg")["Notice"];
			return new clazz();
		};
		public function ENMailType_Builer():Builder{
			return builder.build("msg")["ENMailType"];
		};
		public function getENMailType():ENMailType{
			var clazz:* = builder.build("msg")["ENMailType"];
			return new clazz();
		};
		public function Mail_Builer():Builder{
			return builder.build("msg")["Mail"];
		};
		public function getMail():Mail{
			var clazz:* = builder.build("msg")["Mail"];
			return new clazz();
		};
		public function NetAddress_Builer():Builder{
			return builder.build("msg")["NetAddress"];
		};
		public function getNetAddress():NetAddress{
			var clazz:* = builder.build("msg")["NetAddress"];
			return new clazz();
		};
		public function ConnSvrInfo_Builer():Builder{
			return builder.build("msg")["ConnSvrInfo"];
		};
		public function getConnSvrInfo():ConnSvrInfo{
			var clazz:* = builder.build("msg")["ConnSvrInfo"];
			return new clazz();
		};
		public function Game_Builer():Builder{
			return builder.build("msg")["Game"];
		};
		public function getGame():Game{
			var clazz:* = builder.build("msg")["Game"];
			return new clazz();
		};
		public function EPokerType_Builer():Builder{
			return builder.build("msg")["EPokerType"];
		};
		public function getEPokerType():EPokerType{
			var clazz:* = builder.build("msg")["EPokerType"];
			return new clazz();
		};
		public function WinnerHistroy_Builer():Builder{
			return builder.build("msg")["WinnerHistroy"];
		};
		public function getWinnerHistroy():WinnerHistroy{
			var clazz:* = builder.build("msg")["WinnerHistroy"];
			return new clazz();
		};
	}
}
