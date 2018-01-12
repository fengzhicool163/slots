package view.room
{
	import com.lightUI.manager.storage.StorageManager;
	
	import chinadolls.model.MySoundManager;
	
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.display.Sprite;
	import laya.events.Event;
	
	public class WinnerAni extends Sprite
	{
		
			private var winEffectTemlet:Array;
			private var winEffectSkeleton:Array;
			private var winEffectPath:String = "res/ani/wineffect.sk";
			private var aniSkins:Array = ["w1","w2"];
			public var curskeleton:Skeleton;
			private var skinIndex:int;
			
			public function WinnerAni()
			{
				super();
				winEffectTemlet = [];
				
			}
			
			public function playAni(index:int = 0):void
			{
				skinIndex = index;
				var templet:Templet = winEffectTemlet[0];
				if( templet == null )
				{
					templet = new Templet();
					templet.on(Event.COMPLETE, this, templetLoadComplete,[templet]);
					templet.loadAni(winEffectPath);
					winEffectTemlet[0] = templet;
				}else{
					templetLoadComplete(templet);
				}
				
			}
			
			private function templetLoadComplete(templet:Templet=null):void 
			{
				if(!curskeleton) curskeleton = templet.buildArmature(0);
				
				addChild(curskeleton);
				curskeleton.on(Event.STOPPED, this, skeletonPlayComplete);
				curskeleton.showSkinByName(aniSkins[skinIndex]);
				curskeleton.play(aniSkins[skinIndex],false);
				MySoundManager.getInstance().playVoiceSound("FlagInset");
			}
			private function skeletonPlayComplete(skeleton:Skeleton):void
			{
				this.event("onPlayerAniComplete");
			}
			
			/**
			 * 停止动画，并隐藏 
			 */		
			public function hideEfffect():void
			{
				if(curskeleton)
				{
					curskeleton.off(Event.STOPPED,this,skeletonPlayComplete);
					curskeleton.stop();
					curskeleton.removeSelf();
				}
			}
			
			/**
			 * 销毁动画 
			 */		
			public function destory():void
			{
				hideEfffect();
				this.removeSelf();
				StorageManager.getInstance().getStorage(String(WinnerAni)).rebackObject(this);
			}
		}
}