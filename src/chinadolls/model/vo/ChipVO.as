package chinadolls.model.vo
{

	public class ChipVO
	{
		public var value:Number;///////////////////对应的注额  
		public var type:int;////////////////////对应类型    德州牛仔 中 对应的是13个位置 
		public var isSelf:Boolean = false;/////是否 是自己的筹码 
		
		public function ChipVO(isSelf:Boolean = false,type:int = 0, value:Number = 0):void{
			this.isSelf = isSelf;
			this.type = type;
			this.value = value;
		}
		
		public function equals(vo:ChipVO):Boolean{
			if(this.isSelf == vo.isSelf && this.type == vo.type && this.value == vo.value) return true;
			return false;
		}
	}
}