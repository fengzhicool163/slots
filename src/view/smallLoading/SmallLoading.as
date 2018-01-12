package view.smallLoading
{
	
	import laya.display.Sprite;
	
	import ui.ui.smallLoading.small_loadingUI;
	
	public class SmallLoading extends small_loadingUI
	{
		
		public function SmallLoading()
		{	
			super();
			this.mouseEnabled = true;
		}
		
		public function showme(root:Sprite,msg:String):void{
			root.addChild(this);
			if(msg) txt.text = msg; 
			ani1.play();
		}
		
		public function hideme():void{
			if(this.parent) this.parent.removeChild(this);
			ani1.stop();
		}
		
	}
}