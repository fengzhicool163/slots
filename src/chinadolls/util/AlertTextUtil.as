package chinadolls.util
{
	import com.lightUI.core.Light;
	
	import chinadolls.model.data.MoneyType;

	public class AlertTextUtil
	{
		public function AlertTextUtil()
		{
		}
		
		static public function getEnterRoomText(moneyType:int, tableName:String):String{
			var txt:String = "";
			switch(moneyType){
				case MoneyType.CASH:
					txt = " "+Light.language.getSrting("cashType")+"-";
					break;
				case MoneyType.COIN:
					txt = " "+Light.language.getSrting("coinType")+"-";
					break;
			}
			txt += tableName;
			return txt;
		}
	}
}