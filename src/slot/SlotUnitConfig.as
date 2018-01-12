package slot
{
	public class SlotUnitConfig
	{
		private var bitmap:String;
		private var bitmap_blur:String;
		public function SlotUnitConfig(bg:String , bg_blur:String)
		{
			this.bitmap = bg;
			this.bitmap_blur = bg_blur;
			
		}
		
		public function get bitMap():String{
			return this.bitmap;
		}
		
		public function get bitMapBlur():String{
			return this.bitmap_blur;
		}
		
		
	}
}