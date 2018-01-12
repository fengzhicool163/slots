package view.tipsLoad
{
	
	import com.lightUI.core.Light;
	
	import ui.ui.tipsLoading.tipsLoadPanelUI;
	
	public class TipsLoadPanel extends tipsLoadPanelUI
	{
		private var _tips:Array;
		private var _tipIndex:uint=0;
		public function TipsLoadPanel()
		{
			super();
			var objData:Object = Light.loader.getRes("loadingTipText");
			var objItem:String;
			_tips = [];
			for each (objItem in objData) 
			{
				_tips.push(objItem);
			}
		}
		
		private var currentNum:int = 0;
		private var currentScenceName:String="";
		private	var progressNum:Number = 0;
		public function updateProcess(obj:Object):void
		{
			if(currentScenceName != obj.scenceName && obj.value == 1){
				currentScenceName = obj.scenceName;
				progressNum = ++currentNum;
//				progressNum == obj.total ? currentNum = 0:currentNum;
			}else{
				progressNum = obj.value + currentNum;
			}
			
			var transValue:Number = (progressNum / obj.total) * progressImg.width;
			imgMask.x = transValue - progressImg.width;
			progressImg.mask=imgMask;
			
			if(progressNum == obj.total){
				currentNum = 0;
			}
//			progressTxt.text = ""+parseInt((value * 100).toString())+"%";
		}
		
		public function showMessage():void
		{
//			versionTxt.text = "Version "+Light.language.getSrting("version");
		}
		
		/**
		 * 播放提示
		 */		
		public function playTips():void
		{
			if( this.parent == null )
				return;
		}
		
		public function hideme():void{
			removeSelf();
		}
	}
}