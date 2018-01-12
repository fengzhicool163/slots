package chinadolls.util
{
	

	/**
	 * 常用的静态方法 
	 * @author ws
	 * 
	 */	
	public class BaseStaticFunc
	{
		public static function format(_str:String, ...res):String
		{
			if(!_str)
				return "";
			var str:String=_str;
			for(var i:int = 0; i < res.length; i++)
			{
				str = str.replace("{" + i.toString() + "}", res[i]);
			}
			
			return str;
		}
		
		/**
		 * 减少小数点后多余的值 
		 * @param _money
		 * @return 
		 * 
		 */		
		public static function mathNumberMoney(_money:Number, _times:int):Number
		{
//			_money += 0.001
//			var playerChip:Number = _money * _times;
//			return playerChip / _times;
			return _money;
		}
		
		/**
		 * 转分为元
		 * @return 
		 * 
		 */		
		public static function mathFenToYuan(_fen:int, _times:int):Number
		{
			var yuan:Number = _fen / _times;
			
			return mathNumberMoney(yuan, _times);
		}
		
		/**
		 * 将分转换成元 
		 * @param _fen
		 * @return 
		 * 
		 */		
		public static function mathFenToYuanArr(_fen:int):String
		{
			var yuanArr:Array = new Array();
			
			yuanArr[0] = int(_fen / 100);
			var fen:int = int(_fen % 100);
			if(fen >= 10)
				yuanArr[1] = "." + fen.toString();
			else if(fen >= 0)
				yuanArr[1] = ".0" + fen.toString();
			return BaseStaticFunc.format("￥{0}元", yuanArr[0] + yuanArr[1]);
		}
		
		
		public static function mathYuanToFen(yuan:Number):Number{
			return yuan * 100;
		}
		
		public static function getFrame():int{
			var frame:int = 0;
			switch(Laya.stage.frameRate){
				case "fast":
					frame = 60;
					break;
				case "slow":
					frame = 30;
					break;
				default:
					frame = 30;
			}
			
			return frame;
		}
	}
}