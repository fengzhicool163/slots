package chinadolls.util
{
	import com.lightUI.core.Light;
	import com.lightUI.utils.FormartUtils;
	
	import conf.Money;
	
	import chinadolls.model.data.MoneyType;
	import chinadolls.model.data.RoomData;

	public class MoneyUtils
	{
		/**
		 * 根据钱的类型格式化钱 
		 * @param money 如果是现金，单位为分
		 * @param currency 
		 * @return 
		 */		
		public static function formatMoneyByType(money:Number,currency:int):String
		{
			var re:String = "";
			if(currency == MoneyType.CASH){
				re = "¥" + (money/100).toFixed(2);
			}else{
				re = ""+money;
			}
			return re;
		}
		
		/**
		 * 转换小数点为？ 
		 * @param money
		 * 
		 */		
		public static function moneyReplacePoint(money:String,currency:int):String{
			return money.replace(".","?")
		}
		
		/**
		 * 标准的两位小数显示现金  G币 整数显示  
		 * @param num
		 * @param type
		 * 
		 */			
		public static function standardNumber(num:Number,type:int):String{
			var re:String = String(num);
			if(type == MoneyType.CASH){
				re = FormartUtils.pointNumber(num);
			}
			return re;
		}
		
		public static function standardNumberFromString(num:String,type:int):String{
			var re:String = num;
			if(type == MoneyType.CASH){
				re = FormartUtils.pointNumberFromString(num);
			}
			return re;
		}
		
		public static function getMoneySignType(currency:int):String{
			if(currency == MoneyType.CASH){
				return "￥";
			}
			return "";
		}
		
		public static function moneyTypeDisplay(value:Number, type:int):String{
			if(type == MoneyType.CASH){
				return Number(value).toFixed(2);
			}
			return value.toString();
		}
		
		public static function getMoneyStyleByType(type:int):String{
			if(type == MoneyType.CASH){
				return ".00";
			}
			return "";
		}
		
	
		
		public static function getCashChange(type:int, money:Number):Number{
			if(type == MoneyType.CASH)
				return money / 100;
			return money;
		}
		public static function sendCashChange(type:int, money:Number):Number{
			if(type == MoneyType.CASH)
				return money * 100;
			return money;
		}
	}
}