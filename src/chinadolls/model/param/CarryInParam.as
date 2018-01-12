package chinadolls.model.param 
{
	import com.lightUI.KGameComponents.assetsInPanel.CurrencyType;
	
	import chinadolls.model.data.MoneyType;
	import chinadolls.util.MoneyUtils;

	public class CarryInParam
	{
		public  var cash:int;
		public  var coin:int;
		public  var nm:int;
		private var _betMax:Number;

		public var betMin:Number;
		public var roomName:String;
		public var carrayType:int;
		public var isFirst:Boolean;
		
		public static const NAME:String = "carryInParam";
		public function CarryInParam(o:Object)
		{
			if(o){
				this.cash = MoneyUtils.getCashChange(MoneyType.CASH,o.info.cash);
				this.coin = o.info.coin;
				this.nm = MoneyUtils.getCashChange(MoneyType.CASH,o.info.nm);
			}else
			{
				this.cash = MoneyUtils.getCashChange(MoneyType.CASH,0);//o.info.cash;
				this.coin = 8400;//o.info.coin;
				this.nm = MoneyUtils.getCashChange(MoneyType.CASH,0);//o.info.nm;
			}
		}
		
		
		public function get betMax():Number
		{
			switch(carrayType)
			{
				case CurrencyType.COIN:
				{
					_betMax = coin;
					break;
				}case CurrencyType.CASHANDNM:
				{
					_betMax = cash + nm;
					break;
				}
				default:
				{
					_betMax = cash;
				}
			}
			return _betMax;
		}
		
	}
}