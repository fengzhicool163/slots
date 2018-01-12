package conf
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
			return builder.build("conf")["ENPlatformType"];
		};
		public function getENPlatformType():ENPlatformType{
			var clazz:* = builder.build("conf")["ENPlatformType"];
			return new clazz();
		};
		public function Scope_Builer():Builder{
			return builder.build("conf")["Scope"];
		};
		public function getScope():Scope{
			var clazz:* = builder.build("conf")["Scope"];
			return new clazz();
		};
		public function Scope64_Builer():Builder{
			return builder.build("conf")["Scope64"];
		};
		public function getScope64():Scope64{
			var clazz:* = builder.build("conf")["Scope64"];
			return new clazz();
		};
		public function ENMoneyType_Builer():Builder{
			return builder.build("conf")["ENMoneyType"];
		};
		public function getENMoneyType():ENMoneyType{
			var clazz:* = builder.build("conf")["ENMoneyType"];
			return new clazz();
		};
		public function Money_Builer():Builder{
			return builder.build("conf")["Money"];
		};
		public function getMoney():Money{
			var clazz:* = builder.build("conf")["Money"];
			return new clazz();
		};
		public function Currency_Builer():Builder{
			return builder.build("conf")["Currency"];
		};
		public function getCurrency():Currency{
			var clazz:* = builder.build("conf")["Currency"];
			return new clazz();
		};
		public function Prop_Builer():Builder{
			return builder.build("conf")["Prop"];
		};
		public function getProp():Prop{
			var clazz:* = builder.build("conf")["Prop"];
			return new clazz();
		};
		public function Integer2DTable_Builer():Builder{
			return builder.build("conf")["Integer2DTable"];
		};
		public function getInteger2DTable():Integer2DTable{
			var clazz:* = builder.build("conf")["Integer2DTable"];
			return new clazz();
		};
		public function String2DTable_Builer():Builder{
			return builder.build("conf")["String2DTable"];
		};
		public function getString2DTable():String2DTable{
			var clazz:* = builder.build("conf")["String2DTable"];
			return new clazz();
		};
		public function Double2DTable_Builer():Builder{
			return builder.build("conf")["Double2DTable"];
		};
		public function getDouble2DTable():Double2DTable{
			var clazz:* = builder.build("conf")["Double2DTable"];
			return new clazz();
		};
		public function Risk_Builer():Builder{
			return builder.build("conf")["Risk"];
		};
		public function getRisk():Risk{
			var clazz:* = builder.build("conf")["Risk"];
			return new clazz();
		};
		public function ENRoundState_Builer():Builder{
			return builder.build("conf")["ENRoundState"];
		};
		public function getENRoundState():ENRoundState{
			var clazz:* = builder.build("conf")["ENRoundState"];
			return new clazz();
		};
		public function ENTableState_Builer():Builder{
			return builder.build("conf")["ENTableState"];
		};
		public function getENTableState():ENTableState{
			var clazz:* = builder.build("conf")["ENTableState"];
			return new clazz();
		};
		public function ENTableType_Builer():Builder{
			return builder.build("conf")["ENTableType"];
		};
		public function getENTableType():ENTableType{
			var clazz:* = builder.build("conf")["ENTableType"];
			return new clazz();
		};
		public function Table_Builer():Builder{
			return builder.build("conf")["Table"];
		};
		public function getTable():Table{
			var clazz:* = builder.build("conf")["Table"];
			return new clazz();
		};
		public function ENPlayerState_Builer():Builder{
			return builder.build("conf")["ENPlayerState"];
		};
		public function getENPlayerState():ENPlayerState{
			var clazz:* = builder.build("conf")["ENPlayerState"];
			return new clazz();
		};
		public function PlayerBet_Builer():Builder{
			return builder.build("conf")["PlayerBet"];
		};
		public function getPlayerBet():PlayerBet{
			var clazz:* = builder.build("conf")["PlayerBet"];
			return new clazz();
		};
		public function BetInfo_Builer():Builder{
			return builder.build("conf")["BetInfo"];
		};
		public function getBetInfo():BetInfo{
			var clazz:* = builder.build("conf")["BetInfo"];
			return new clazz();
		};
		public function PokerInfo_Builer():Builder{
			return builder.build("conf")["PokerInfo"];
		};
		public function getPokerInfo():PokerInfo{
			var clazz:* = builder.build("conf")["PokerInfo"];
			return new clazz();
		};
		public function TexasPokerResultType_Builer():Builder{
			return builder.build("conf")["TexasPokerResultType"];
		};
		public function getTexasPokerResultType():TexasPokerResultType{
			var clazz:* = builder.build("conf")["TexasPokerResultType"];
			return new clazz();
		};
		public function ENBetType_Builer():Builder{
			return builder.build("conf")["ENBetType"];
		};
		public function getENBetType():ENBetType{
			var clazz:* = builder.build("conf")["ENBetType"];
			return new clazz();
		};
		public function BetItem_Builer():Builder{
			return builder.build("conf")["BetItem"];
		};
		public function getBetItem():BetItem{
			var clazz:* = builder.build("conf")["BetItem"];
			return new clazz();
		};
		public function BetLocation_Builer():Builder{
			return builder.build("conf")["BetLocation"];
		};
		public function getBetLocation():BetLocation{
			var clazz:* = builder.build("conf")["BetLocation"];
			return new clazz();
		};
		public function ChanceCoin_Builer():Builder{
			return builder.build("conf")["ChanceCoin"];
		};
		public function getChanceCoin():ChanceCoin{
			var clazz:* = builder.build("conf")["ChanceCoin"];
			return new clazz();
		};
		public function ChanceCash_Builer():Builder{
			return builder.build("conf")["ChanceCash"];
		};
		public function getChanceCash():ChanceCash{
			var clazz:* = builder.build("conf")["ChanceCash"];
			return new clazz();
		};
		public function HitSts_Builer():Builder{
			return builder.build("conf")["HitSts"];
		};
		public function getHitSts():HitSts{
			var clazz:* = builder.build("conf")["HitSts"];
			return new clazz();
		};
		public function lotteryConfig_Builer():Builder{
			return builder.build("conf")["lotteryConfig"];
		};
		public function getlotteryConfig():lotteryConfig{
			var clazz:* = builder.build("conf")["lotteryConfig"];
			return new clazz();
		};
		public function DirtyWord_Builer():Builder{
			return builder.build("conf")["DirtyWord"];
		};
		public function getDirtyWord():DirtyWord{
			var clazz:* = builder.build("conf")["DirtyWord"];
			return new clazz();
		};
		public function ENNoticeType_Builer():Builder{
			return builder.build("conf")["ENNoticeType"];
		};
		public function getENNoticeType():ENNoticeType{
			var clazz:* = builder.build("conf")["ENNoticeType"];
			return new clazz();
		};
		public function ENNoticeLocation_Builer():Builder{
			return builder.build("conf")["ENNoticeLocation"];
		};
		public function getENNoticeLocation():ENNoticeLocation{
			var clazz:* = builder.build("conf")["ENNoticeLocation"];
			return new clazz();
		};
		public function Notice_Builer():Builder{
			return builder.build("conf")["Notice"];
		};
		public function getNotice():Notice{
			var clazz:* = builder.build("conf")["Notice"];
			return new clazz();
		};
		public function ENMailType_Builer():Builder{
			return builder.build("conf")["ENMailType"];
		};
		public function getENMailType():ENMailType{
			var clazz:* = builder.build("conf")["ENMailType"];
			return new clazz();
		};
		public function Mail_Builer():Builder{
			return builder.build("conf")["Mail"];
		};
		public function getMail():Mail{
			var clazz:* = builder.build("conf")["Mail"];
			return new clazz();
		};
		public function NetAddress_Builer():Builder{
			return builder.build("conf")["NetAddress"];
		};
		public function getNetAddress():NetAddress{
			var clazz:* = builder.build("conf")["NetAddress"];
			return new clazz();
		};
		public function ConnSvrInfo_Builer():Builder{
			return builder.build("conf")["ConnSvrInfo"];
		};
		public function getConnSvrInfo():ConnSvrInfo{
			var clazz:* = builder.build("conf")["ConnSvrInfo"];
			return new clazz();
		};
		public function Game_Builer():Builder{
			return builder.build("conf")["Game"];
		};
		public function getGame():Game{
			var clazz:* = builder.build("conf")["Game"];
			return new clazz();
		};
		public function EPokerType_Builer():Builder{
			return builder.build("conf")["EPokerType"];
		};
		public function getEPokerType():EPokerType{
			var clazz:* = builder.build("conf")["EPokerType"];
			return new clazz();
		};
		public function WinnerHistroy_Builer():Builder{
			return builder.build("conf")["WinnerHistroy"];
		};
		public function getWinnerHistroy():WinnerHistroy{
			var clazz:* = builder.build("conf")["WinnerHistroy"];
			return new clazz();
		};
	}
}
