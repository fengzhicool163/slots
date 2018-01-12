package view.hall
{
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.events.Event;
	
	import ui.ui.hall.HallUI;

	public class Hall extends HallUI
	{
		public var templet:Templet;
		public var curskeleton:Skeleton; 
		private var skeletonUrl:String = "res/ani/cowgirl.sk";
		public function Hall()
		{
			super();
			list.visible = false;
			on(Event.ADDED, this, onAdded);
		}
		
		private function onAdded():void
		{
		}
		
		private function initAnimation():void{
			if(!templet){
				templet = new Templet();
				templet.on(Event.COMPLETE, this, onTempletComplete);
				templet.loadAni(skeletonUrl);
			}else{
				onTempletComplete();
			}
		}
		
		private function onTempletComplete():void
		{
			curskeleton = templet.buildArmature(0);
			curskeleton.pos(330,1000);
			curskeleton.play(0,true);
			addChild(curskeleton);		
		}
		
		public function showRoomList(data:Array):void{
			list.array = data;
			list.visible = true;
			initAnimation();
//			if(!list.scrollBar.changeHandler) list.scrollBar.changeHandler = new Handler(this, onScrollChange);	
		}		
		
		public function despose():void
		{
			curskeleton.removeSelf();
			curskeleton.stop();
//			curskeleton.destroy()
			list.array = null;
		} 
		
	}
}