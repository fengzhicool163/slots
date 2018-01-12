package chinadolls.util
{
	import com.lightUI.core.Light;
	
	import conf.EPokerType;
	
	import chinadolls.model.vo.PokerVo;
	
	import laya.resource.Texture;
	
	public class PokerTypeUtil
	{
		public function PokerTypeUtil()
		{
		}
		
		/**
		 * 判断扑克牌型
		 */
		
		public static function judgePokerType(pokers:Array):Array{
			var pokerAry:Array = [];
			for(var i:int = 0; i<pokers.length; i++){
				var pokerVo:PokerVo = new PokerVo();
				pokerVo.id = pokers[i];
				pokerVo.num = Math.floor(pokers[i]/10);
				pokerVo.type = pokers[i]%10;
				pokerAry.push(pokerVo);
			}
			return pokerAry;
		}
		//test
		public static function judgePokerType2(pokers:Array):Array{
			var pokerAry:Array = [];
			for(var i:int = 0; i<pokers.length; i++){
				var pokerVo:PokerVo = new PokerVo();
				pokerVo.num = pokers[i];
				pokerVo.type = getRandomNum(0,3);
				pokerVo.index = i;
				pokerAry.push(pokerVo);
			}
			return pokerAry;
		}
		
		/**
		 * 赢牌牌型判断
		 */
		public static function winnerPokerType(winPokerAry:Array):*{
			return null
		}
		
		
		/**
		 * 定位结果牌型位置
		 */
		public static function locationPokerType():Object{
		
			return null;
		}
		
		
		public static function getPokerUrl(num:int, type:int):String{
			var url:String = "";
			switch(type){
				case PokerVo.HEI:
					url = "room/poker/HEI_"+num+".png";
					break;
				case PokerVo.HONG:
					url = "room/poker/HONG_"+num+".png";
					break;
				case PokerVo.MEI:
					url = "room/poker/MEI_"+num+".png";
					break;
				case PokerVo.FANG:
					url = "room/poker/FANG_"+num+".png";
					break;
			}
			return url;
		}
		
		public static function getRandomNum(min:int, max:int):int
		{
			var range:int = max - min;
			var result:int = Math.round(Math.random()*range)+min;
			return result;
		}
		
		public static function getPokerWord(num:int):Array{
			var texture:Texture=null;
			var word:String="";
			
			if(num<1000){
				texture = Light.loader.getRes("room/graycard.png");
			}else if(num>=1000 && num<2000){
				texture = Light.loader.getRes("room/redcard.png");
			}else if(num>=2000){
				texture = Light.loader.getRes("room/bluecard.png");
				
			}
			var pokerType:int = num%1000;
			
			switch(pokerType)
			{
				case EPokerType.duizi:
					word = "对子";
					break;
				case EPokerType.gaopai:
					word = "高牌";
					break;
				case EPokerType.duizi2:
					word = "两对";
					break;
				case EPokerType.qingyise:
					word = "同花";
					break;
				case EPokerType.shunzi:
					word = "顺子";
					break;
				case EPokerType.qingyiseshunzi:
					word = "同花顺";
					break;
				case EPokerType.zhadan4:
					word = "金刚";
					break;
				case EPokerType.zhandan3:
					word = "三条";
					break;
				case EPokerType.zhandan3_duizi:
					word = "葫芦";
					break;
				case EPokerType.huangjia:
					word = "皇家"
				default:
					break;
			}
			return [texture,word];
			
		}
		
	}
}