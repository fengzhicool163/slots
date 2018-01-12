package chinadolls.model.vo
{
	public class PokerVo
	{
		public static const HEI:int = 0;
		public static const HONG:int = 1;
		public static const MEI:int = 2;
		public static const FANG:int = 3;
		
		private var _id:int;
		private var _index:int;
		private var _type:int;
		private var _num:int;
		
		public function PokerVo()
		{
		}

		public function get id():int
		{
			return _id;
		}

		public function set id(value:int):void
		{
			_id = value;
		}

		public function get index():int
		{
			return _index;
		}

		public function set index(value:int):void
		{
			_index = value;
		}

		public function get num():int
		{
			return _num;
		}

		public function set num(value:int):void
		{
			_num = value;
		}

		public function get type():int
		{
			return _type;
		}

		public function set type(value:int):void
		{
			_type = value;
		}

	}
}