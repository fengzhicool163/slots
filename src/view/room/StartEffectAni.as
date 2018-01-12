package view.room
{
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.display.Sprite;
	import laya.events.Event;
	
	public class StartEffectAni extends Sprite
	{
		
			private var winEffectTemlet:Array;
			private var winEffectSkeleton:Array;
			private var winEffectPath:String = "res/ani/starteffect.sk";
			public function StartEffectAni()
			{
				super();
				winEffectTemlet = [];
				winEffectSkeleton = [];
				
			}
			
			public function playAni(index:int = 0):void
			{
				var templet:Templet = winEffectTemlet[index];
				if( templet == null )
				{
					templet = new Templet();
					templet.on(Event.COMPLETE, this, templetLoadComplete);
					templet.loadAni(winEffectPath);
					winEffectTemlet[index] = templet;
				}else{
					templetLoadComplete(templet);
				}
				
			}
			
			private function templetLoadComplete(templet:Templet=null):void 
			{
				var index:int = winEffectTemlet.indexOf(templet);
				if( index == -1 )
					return;
				var skeleton:Skeleton = winEffectSkeleton[index];
				if( skeleton == null )
				{
					skeleton = templet.buildArmature(0);
					winEffectSkeleton[index] = skeleton;
				}
				addChild(skeleton);
				skeleton.on(Event.STOPPED, this, skeletonPlayComplete,[skeleton]);
				skeleton.play(0,false);
			}
			private function skeletonPlayComplete(skeleton:Skeleton):void
			{
				skeleton.off(Event.STOPPED, this, skeletonPlayComplete);
//				this.event("onCarAniPlayComplete");
			}
			
			/**
			 * 停止动画，并隐藏 
			 */		
			public function hideEfffect():void
			{
				for (var i:int = 0; i < winEffectPath.length; i++) 
				{
					var skeleton:Skeleton = winEffectSkeleton[i];
					if( skeleton )
					{
						skeleton.off(Event.STOPPED,this,skeletonPlayComplete);
						skeleton.stop();
						skeleton.removeSelf();
					}
				}
				
			}
			
			/**
			 * 销毁动画 
			 */		
			public function destory():void
			{
				hideEfffect();
				for (var i:int = 0; i < winEffectPath.length; i++) 
				{
					var skeleton:Skeleton = winEffectSkeleton[i];
					if( skeleton && skeleton.parent)
					{
						skeleton.destroy(true);
					}
				}
			}
		}
}