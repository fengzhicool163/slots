package view.room
{
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.display.Sprite;
	import laya.events.Event;
	
	public class PlayerEffectAni extends Sprite
	{
		
			private var temlets:Array;
			private var skeletons:Array;
			private var pathArr:Array;
			private var aniSkins:Array;
			private var skinIndex:int = 0;
			private var count:int;
			private var curSkeleton:Skeleton = null;
			
			public function PlayerEffectAni()
			{
				temlets = [];
				skeletons = [];
				pathArr = ["res/ani/cowboy.sk","res/ani/bull.sk"];
				aniSkins = ["Animation2","Animation1","Animation3"];
				count = pathArr.length;
			}
			
			public function playAni(_skinIndex:int):void
			{
				skinIndex = _skinIndex;
				if( curSkeleton == null )
					return;
				addChild(curSkeleton);
				
				curSkeleton.stop();
				curSkeleton.showSkinByName(aniSkins[skinIndex]);
				curSkeleton.play(aniSkins[skinIndex],true);
			}
			
			public function setBei(indexSK:int):void
			{
				var templet:Templet = temlets[0];
				if( templet == null )
				{
					templet = new Templet();
					templet.on(Event.COMPLETE, this, templetLoadComplete);
					templet.loadAni(pathArr[indexSK]);
					temlets[0] = templet;
				}else{
					templetLoadComplete(templet);
				}
			}
			
			private function templetLoadComplete(templet:Templet=null):void 
			{
//				var index:int = temlets.indexOf(templet);
//				if( index == -1 || index >= count )
//					return;
				var skeleton:Skeleton = skeletons[0];
				if( skeleton == null )
				{
					skeleton = templet.buildArmature(0); //支持换装
					skeletons[0] = skeleton;
				}
				curSkeleton = skeleton;
			}
			private function skeletonPlayComplete():void
			{
				if( curSkeleton ) {
					curSkeleton.off(Event.STOPPED,this,skeletonPlayComplete);
					curSkeleton.stop();
				}
			}
			
			/**
			 * 停止动画，并隐藏 
			 */		
			public function hideAni():void
			{
				for (var i:int = 0; i < count; i++) 
				{
					var skeleton:Skeleton = skeletons[i];
					if( skeleton && skeleton.parent)
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
				hideAni();
				for (var i:int = 0; i < skeletons.length; i++) 
				{
					var skeleton:Skeleton = skeletons[i];
					if( skeleton && skeleton.parent)
					{
						skeleton.destroy(true);
					}
				}
			}
		}
}