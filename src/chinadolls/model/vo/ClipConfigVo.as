package chinadolls.model.vo
{
	public class ClipConfigVo
	{
		/** 房间类型，这个值对应 CurrencyType中的值*/
		public var type:uint;
		/** 显示选择筹码对应的筹码值， 长度为5， 第6个位置是max所以不再数组内 */
		public var selectClips:Array;
		/** 筹码配置概率 */
		public var clipConfigs:Array;
		/** 房间级别 */
		public var level:int;
		
		public function ClipConfigVo()
		{
		}
	}
}