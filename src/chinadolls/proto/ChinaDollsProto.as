package chinadolls.proto
{

	import com.IProtobuf.Builder
	import laya.utils.Browser
	public class ChinaDollsProto
	{
		private var ProtoBuf:* = Browser.window.dcodeIO.ProtoBuf
		private var builder:*
		public function loadProtoFile(protoPath:String):void{
			builder = ProtoBuf.loadProtoFile(protoPath)
		}
		public function ExMessageID_Builer():Builder{
			return builder.build("chinadolls.proto")["ExMessageID"];
		};
		public function getExMessageID():ExMessageID{
			var clazz:* = builder.build("chinadolls.proto")["ExMessageID"];
			return new clazz();
		};
		public function ErrorCode_Builer():Builder{
			return builder.build("chinadolls.proto")["ErrorCode"];
		};
		public function getErrorCode():ErrorCode{
			var clazz:* = builder.build("chinadolls.proto")["ErrorCode"];
			return new clazz();
		};
		public function LoginNotify_Builer():Builder{
			return builder.build("chinadolls.proto")["LoginNotify"];
		};
		public function getLoginNotify():LoginNotify{
			var clazz:* = builder.build("chinadolls.proto")["LoginNotify"];
			return new clazz();
		};
		public function BringMoneyRequest_Builer():Builder{
			return builder.build("chinadolls.proto")["BringMoneyRequest"];
		};
		public function getBringMoneyRequest():BringMoneyRequest{
			var clazz:* = builder.build("chinadolls.proto")["BringMoneyRequest"];
			return new clazz();
		};
		public function BringMoneyResponse_Builer():Builder{
			return builder.build("chinadolls.proto")["BringMoneyResponse"];
		};
		public function getBringMoneyResponse():BringMoneyResponse{
			var clazz:* = builder.build("chinadolls.proto")["BringMoneyResponse"];
			return new clazz();
		};
		public function WinLines_Builer():Builder{
			return builder.build("chinadolls.proto")["WinLines"];
		};
		public function getWinLines():WinLines{
			var clazz:* = builder.build("chinadolls.proto")["WinLines"];
			return new clazz();
		};
		public function GameResult_Builer():Builder{
			return builder.build("chinadolls.proto")["GameResult"];
		};
		public function getGameResult():GameResult{
			var clazz:* = builder.build("chinadolls.proto")["GameResult"];
			return new clazz();
		};
		public function BettingRequest_Builer():Builder{
			return builder.build("chinadolls.proto")["BettingRequest"];
		};
		public function getBettingRequest():BettingRequest{
			var clazz:* = builder.build("chinadolls.proto")["BettingRequest"];
			return new clazz();
		};
		public function BettingResponese_Builer():Builder{
			return builder.build("chinadolls.proto")["BettingResponese"];
		};
		public function getBettingResponese():BettingResponese{
			var clazz:* = builder.build("chinadolls.proto")["BettingResponese"];
			return new clazz();
		};
		public function TestBettingRequest_Builer():Builder{
			return builder.build("chinadolls.proto")["TestBettingRequest"];
		};
		public function getTestBettingRequest():TestBettingRequest{
			var clazz:* = builder.build("chinadolls.proto")["TestBettingRequest"];
			return new clazz();
		};
		public function TestBettingResponese_Builer():Builder{
			return builder.build("chinadolls.proto")["TestBettingResponese"];
		};
		public function getTestBettingResponese():TestBettingResponese{
			var clazz:* = builder.build("chinadolls.proto")["TestBettingResponese"];
			return new clazz();
		};
		public function BonusRequest_Builer():Builder{
			return builder.build("chinadolls.proto")["BonusRequest"];
		};
		public function getBonusRequest():BonusRequest{
			var clazz:* = builder.build("chinadolls.proto")["BonusRequest"];
			return new clazz();
		};
		public function BonusResponese_Builer():Builder{
			return builder.build("chinadolls.proto")["BonusResponese"];
		};
		public function getBonusResponese():BonusResponese{
			var clazz:* = builder.build("chinadolls.proto")["BonusResponese"];
			return new clazz();
		};
		public function BonusOverRequest_Builer():Builder{
			return builder.build("chinadolls.proto")["BonusOverRequest"];
		};
		public function getBonusOverRequest():BonusOverRequest{
			var clazz:* = builder.build("chinadolls.proto")["BonusOverRequest"];
			return new clazz();
		};
		public function ExMSG_Builer():Builder{
			return builder.build("chinadolls.proto")["ExMSG"];
		};
		public function getExMSG():ExMSG{
			var clazz:* = builder.build("chinadolls.proto")["ExMSG"];
			return new clazz();
		};
	}
}
