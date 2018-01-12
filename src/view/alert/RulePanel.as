package view.alert
{
	import com.lightUI.core.Light;
	import com.lightUI.manager.PopupManager;
	
	import laya.events.Event;
	import laya.ui.List;
	import laya.utils.Color;
	
	import ui.ui.alert.RulePanelUI;
	
	public class RulePanel extends RulePanelUI
	{
		private var objData:Object;
		public function RulePanel()
		{
			objData = Light.loader.getRes("rule");
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			//btnClose.on(Event.CLICK, this, onClick);
			initMsg();
			//List
		}
		
		private function onClick():void
		{
			PopupManager.removePopUp(this);
			visible = false;
		}
		
		override public function show(closeOther:Boolean=false):void{
			popup(closeOther);
			PopupManager.addPopUp(this,Light.root,true, Color.create("#010101"));
			PopupManager.centerPopUp(this);
			visible = true;
		}
		
		private function initMsg():void{
//			basicRuleTxt.text = objData["title1"]["CN"];
//			instruction1.text = objData["instruction1"]["CN"];
//			instruction2.text = objData["instruction2"]["CN"];
//			instruction3.text = objData["instruction3"]["CN"];
//			winTypeTxt.text = objData["title2"]["CN"];
//			instruction4.text = objData["instruction4"]["CN"];
//			instruction5.text = objData["instruction5"]["CN"];
//			instruction6.text = objData["instruction6"]["CN"];
//			title3.text = objData["title3"]["CN"];
//			instruction7.text = objData["instruction7"]["CN"];
//			instruction8.text = objData["instruction8"]["CN"];
//			instruction9.text = objData["instruction9"]["CN"];
//			instruction10.text = objData["instruction10"]["CN"];
//			instruction11.text = objData["instruction11"]["CN"];
//			instruction12.text = objData["instruction12"]["CN"];
//			instruction13.text = objData["instruction13"]["CN"];
//			instruction14.text = objData["instruction14"]["CN"];
//			instruction15.text = objData["instruction15"]["CN"];
//			instruction16.text = objData["instruction16"]["CN"];
		}
		
		override public function close(type:String=null):void{
			//			super.close(type);
			PopupManager.removePopUp(this);
			visible = false;
		}
	}
}