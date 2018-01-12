package slot
{
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	import com.lightUI.manager.timer.Timer;
	
	import action.ActionManager;
	import action.AddImageAction;
	import action.PlayEffect;
	import action.PlayLargeSprite;
	import action.ScaleAnimation;
	import action.SequenceAction;
	
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.display.Animation;
	import laya.display.Node;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.maths.Rectangle;
	import laya.net.Loader;
	import laya.ui.Image;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Tween;
	import laya.webgl.canvas.BlendMode;

	public class SlotScroller extends Sprite
	{
		//public var curskeleton:Skeleton; 
		//public var templet:Templet;
		private var _config:Array;
		private var _visibleItemNum:int;
		private var _visibleHeight:int;
		private var _visibleWidth:int;
		private var _running:Boolean = false;
		private var _unitGap:int = -1;
		private var _container:Sprite;
		private var _l1:Sprite;
		private var _l2:Sprite;
		private var MAX_SPEED:int = 50;   //最大速度
		private var INIT_SPEED:int = 2;   // 初始速度
		private var SPEED_STEP:int = 3;   // 速度增加量 相当于加速度
		private var SPEED_SLOW:int = 3;
		private var MAX_SPEED_TIME:Number = 1.0;
		private var RAND_SPEED_TIME:Number = 0;
		
		private var _speed:int = this.INIT_SPEED;
		private var _maxSpeed:int = this.MAX_SPEED;
		private var _scrollStatus:int = -1;        // 当前旋转得状态，1是加速时期，2是最高速度得匀速时期，3减速时期
		private var _containerHeight:int = 0;
		
		private var _isStop:Boolean = true;

		public function get stageEffect():Sprite
		{
			return _stageEffect;
		}

		public function set stageEffect(value:Sprite):void
		{
			_stageEffect = value;
		}

		public function get effectLayer():Sprite
		{
			return _effectLayer;
		}

		public function set effectLayer(value:Sprite):void
		{
			_effectLayer = value;
		}

		public function get spriteLayer():Sprite
		{
			return _spriteLayer;
		}

		public function set spriteLayer(value:Sprite):void
		{
			_spriteLayer = value;
		}

		private var _onComplete:Function;
		private var _onCompleteContext:*;
		
		private var _timer:Timer;
		private var _model:Boolean = false;
		
		private var _endIndex:int = 6;   // 最后显示的位置
		private var _fixL1:Boolean = false;  // 是否用L1的容器显示
		private var _finalStepDetermined:Boolean = false;
		
		private var _mask:Sprite;   // 遮罩
		private var _effectLayer:Sprite;  //遮罩上的特效层
		private var _spriteLayer:Sprite;  //遮罩上的元素曾
		private var _itemHeight:int;
		
		private var effect:String = "res/atlas/effects_ani03.json";
		private var effect2:String = "res/atlas/effects_ani01.json";
		private var rewardEffectUrl:String = "res/atlas/slots/images.json";
		private var _stage:*;
		private var _stageEffect:Sprite;
		public function SlotScroller(config:Array,w:int , h:int,visibleItemNum:int)
		{
			super();
			this.on(Event.ADDED , this ,onAdded);
			this._config = config;
			this._visibleHeight = h;
			this._visibleWidth = w;
			this._visibleItemNum = visibleItemNum;
			this._container = new Sprite();
			this.addChild(this._container);
			this.width = w;
			this.height = h;
			
		}
		
		
		public function onAdded():void{
			this._container.scrollRect = new Rectangle(0,0,300,this.height);
			var bgContainer:Sprite;
			var itemHeight:int = this._visibleHeight / this._visibleItemNum;
			this._itemHeight = itemHeight;
			this._containerHeight = itemHeight/2;
			this._l1 = new Sprite();
			
			for( var i:int = 0 ; i < this._config.length ; i++){
				bgContainer = new Sprite();
				
				var config:* = this._config[i];
				var bg:Image = new Image();
				bg.autoSize = true;
				var s:* = Loader.getAtlas("slotview");
				var url:String = "slots/" + config.bitmap + ".png" ;
				//bg.source =  Light.loader.getRes(url);
				bg.skin = url;
				
				this._unitGap = Math.round((itemHeight - bg.height)/2);
				bg.y = this._unitGap;
				bg.x = Math.round((this._visibleWidth - bg.width)/2);
//				bg.anchorX = 0.5;
//				bg.x = Math.round(this._visibleWidth/2);
				bgContainer.addChild(bg);
				
				var bg_:Image = new Image();
				bg_.autoSize = true;
				var url_b:String = "slots/" + config.bitMapBlur + ".png";
				bg_.skin = url_b;
				bg_.y = this._unitGap;
//				bg_.anchorX = 0.5;
//				bg_.x = Math.round(this._visibleWidth/2);
				bg_.x =Math.round((this._visibleWidth - bg_.width)/2);
				bg_.visible = false;
				bgContainer.addChild(bg_);
				
				//bgContainer.x = Math.round((this._visibleWidth - bg.width)/2);
				
				bgContainer.y = this._l1.numChildren ? this.l1Height : 0;
				this._l1.addChild(bgContainer);
				
			}
		
			this._container.addChild(this._l1);
			
			
			this._l2 = new Sprite();
			
			for( var i:int = 0 ; i < this._config.length ; i++){
				bgContainer = new Sprite();
				
				var config:* = this._config[i];
				var bg:Image = new Image();
				bg.autoSize = true;
				var url:String = "slots/" + config.bitmap + ".png" ;
				bg.skin = url;
				
				this._unitGap = Math.round((itemHeight - bg.height)/2);
				bg.y = this._unitGap;
				bg.x = Math.round((this._visibleWidth - bg.width)/2);
//				bg.anchorX = 0.5;
//				bg.x = Math.round(this._visibleWidth/2);
				bgContainer.addChild(bg);
				
				
				var bg_:Image = new Image();
				bg_.autoSize = true;
				var url_b:String = "slots/" + config.bitMapBlur + ".png";
				bg_.skin = url_b;
				bg_.y = this._unitGap;
//				bg_.anchorX = 0.5;
//				bg_.x = Math.round(this._visibleWidth/2);
				bg_.x =Math.round((this._visibleWidth - bg_.width)/2);
				bg_.visible = false;
				bgContainer.addChild(bg_);
				
				
				//bgContainer.x = Math.round((this._visibleWidth - bg.width)/2);
				bgContainer.y = this._l2.numChildren ? this.l2Height : 0;
				this._l2.addChild(bgContainer);
				
			}
			
			this._container.addChild(this._l2);
			this._l2.y = -this.l2Height;
			
			
			this._mask = new Sprite();
			this._mask.width = this._visibleWidth;
			this._mask.height = this._visibleHeight;
			this.addChild(this._mask);
			this._mask.graphics.drawRect(0,0,this._visibleWidth,this._visibleHeight,"#000000");
			this._mask.alpha = 0.6;
			this._mask.visible = false;
			
			this.effectLayer = new Sprite();
			this._mask.addChild(this.effectLayer);
			this.spriteLayer = new Sprite();
			this._mask.addChild(this.spriteLayer);
			
			var sp:Sprite = this._container.getChildAt(0) as Sprite;
			
		}
		
		
		public function setStage(stage:*):void{
			this._stage = stage;
		}
		
		
		public function getStage():Sprite{
			return this._stage;
		}
		
		private function get l1Height():int {
			//return this._containerHeight + this._unitGap;
			return (2*this._l1.numChildren )* this._containerHeight;
		}
		
		private function get l2Height():int {
			//return this._l2.height + this._unitGap;
			return (2*this._l2.numChildren )* this._containerHeight;
		}
		
		
		public function start(onComplete:Function , context:*,speed:Boolean=false):void{
			setOnCompleteCallback(onComplete , context);
			onSlot(speed);
		}
		
		public function setOnCompleteCallback(onComplete:Function , context:*):void{
			this._onComplete = onComplete;
			this._onCompleteContext = context;
		}
		
		public function onSlot(speed:Boolean=false):void{
			this._running = true;
			this._timer = new Timer();
			var num:int = 4;
			if(speed){
				this.SPEED_STEP = 10;
				num = 0.5;
			}
			else{
				this.SPEED_STEP = 3;
			}
			
			this.MAX_SPEED_TIME = Math.round(num *this._timer.frameRate);
			this._scrollStatus = 1;
			this._timer.registeFrameLoop(this , scroll);
			
			
			
			//Tween.to(this._l1 , {y:300},3000,Ease.backOut);
			//Tween.to(this._l2 ,{y:0,ease:Ease.elasticOut} , 3000);
		
		}
		
		
		public function scroll():void{
			if(this._l1.y > this._visibleHeight){
				this._l1.y = this._l2.y - this.l1Height;
			}
			else if ((this._l1.y + this.l1Height) < this._visibleHeight) {
				this._l2.y = this._l1.y + this.l1Height;
			}
			if(this._l2.y > this._visibleHeight){
				this._l2.y = this._l1.y - this.l2Height;
			}else if ((this._l2.y + this.l2Height) < this._visibleHeight) {
				this._l1.y = this._l2.y + this.l2Height;
			}
			
			this._l1.y += this._speed;
			this._l2.y += this._speed;
//			if(this._isStop){
//				var isstop = this._l1.y < 0 && ((this._l1.y+ this.l1Height) > this._visibleHeight);
//				if(SlotMain.getInstance().getResult().length){
//					this._scrollStatus = 3;
//					this._speed = 0;
//				}
//			}
			if(this._scrollStatus == 1){
				if(this._speed <= this._maxSpeed){
					this._speed += this.SPEED_STEP;
					if(this._speed >15){
						toMode(true);
					}
				}
				else{
					this._scrollStatus = 2;
					this._speed = this._maxSpeed;
					
				}
				
			}
			else if(this._scrollStatus == 2){
				this._speed = this._maxSpeed;
				this.MAX_SPEED_TIME--;
				var isstop = this._l1.y < 0 && ((this._l1.y+ this.l1Height) > this._visibleHeight);
				if(this.MAX_SPEED_TIME <= 0 && isstop){
					if(SlotMain.getInstance().getResult().length){
						this._scrollStatus = 3;
						this._speed = 0;
					}
					
				}
				
				
			}
			else{
				if(this._speed <= 0){
					//this.onEnd();
					this.toMode(false);
				}
				//this._speed -= this.SPEED_SLOW;
				this._speed = 0;
				if(!this._finalStepDetermined){
					this._finalStepDetermined = true;
					var l1EndPos:Number = (this._l1.getChildAt(this._endIndex) as Sprite).y;
					var l1Pos:Number = this._l1.y;
					
					var l2EndPos:Number = (this._l2.getChildAt(this._endIndex) as Sprite).y;
					var l2Pos:Number = this._l2.y;
					
					var l1CurPos:Number = l1Pos + l1EndPos;
					var l2CurPos:Number = l2Pos + l2EndPos;
					
					var dis:Number=0;
					if(l1Pos > -this.l1Height && l1EndPos < this._visibleHeight){
						
						this._fixL1 = true;
						dis = this.l1Height + this.l2Height + l1CurPos;
						var pos:Number =  -(2*this._endIndex )* this._containerHeight;
						Tween.to(this._l1 , {y:pos},1000,Ease.elasticOut,Handler.create(this,scrollupdate));
						this._l2.y = pos-this.l2Height;
					}
					else{
						this._fixL1 = false;
						
						dis = this.l1Height + this.l2Height + l2CurPos;
						var pos:Number =  -(2*this._endIndex )* this._containerHeight;
						Log.debug("l2 scroll ==========>",this._l2.y,":",pos);
						Tween.to(this._l2 , {y:pos},1000,Ease.elasticOut,Handler.create(this,scrollupdate));
						this._l1.y = pos - this.l1Height;
					}
					return ;
				}
				
				
				
				
			}
			
			
		}
		
		public function EaseFunc():Number{
			var num = Ease.elasticInOut(0,0,0,0,0);
			return num;
		}
		
		
		public function toMode(b:Boolean):void{
			if(this._model != b){
				this._model = b;
				var num:int = this._l1.numChildren;
				for(var i:int = 0 ; i < num ; i++){
					var c:Sprite = this._l1.getChildAt(i) as Sprite;
					var bit:Sprite = c.getChildAt(0) as Sprite;
					bit.visible = !b;
					var blur:Sprite = c.getChildAt(1) as Sprite;
					blur.visible = b;
					
				}
				
				var numb:int = this._l2.numChildren;
				for(var i:int = 0 ; i < numb ; i++){
					var c:Sprite = this._l2.getChildAt(i) as Sprite;
					var bit:Sprite = c.getChildAt(0) as Sprite;
					bit.visible = !b;
					var blur:Sprite = c.getChildAt(1) as Sprite;
					blur.visible = b;
					
				}
			}
		
		}
		
		public function onEnd():void{
			this._timer.removeFrameLoop(scroll);
			if(this._onComplete && this._onCompleteContext)
			{
				this._onComplete.call(this._onCompleteContext);
			}
			
		
			_finalStepDetermined = false;
			
		}
	
		
		public function setEndIndex(index:int):void{
			this._endIndex = index;
		}
		
		
		public function scrollupdate():void{
			Log.debug("scroll update");
			this.onEnd();
		}
		
		
		public function setResult(result:Array):void{
			var length:int = result.length;
			for(var i:int=0 ; i < length ; i++){
				var container:Sprite = this._l1.getChildAt(this._endIndex+i) as Sprite;
				var config:* = result[i];
			    var bg:Image = container.getChildAt(0) as Image;
				
				var url:String = "slots/" + config.bitmap + ".png";
				bg.skin =url;
				bg.x =Math.round((this._visibleWidth - bg.width)/2);;
				var bg_:Image = container.getChildAt(1) as Image;
				var url_b:String = "slots/" + config.bitMapBlur + ".png";
				bg_.skin = url_b;
				bg_.x = Math.round((this._visibleWidth - bg_.width)/2);;
				
				var container2:Sprite = this._l2.getChildAt(this._endIndex+i) as Sprite;
				var bg2:Image = container2.getChildAt(0) as Image;
				bg2.source = Light.loader.getRes(url);
				bg2.x = Math.round((this._visibleWidth - bg2.width)/2);;
				var bg2_:Image = container2.getChildAt(1) as Image;
				bg2_.source = Light.loader.getRes(url_b);
				bg2_.x = Math.round((this._visibleWidth - bg2_.width)/2);;
			}
		}
		
		
		public function setMaskVisible(b:Boolean):void{
			this._mask.visible = b;
			if(!b){
				//this._mask.destroyChildren();
				this._stageEffect.destroyChildren();
				this._stage.destroyChildren();
				this._spriteLayer.destroyChildren();
			}
		}
		
		
		public function clearEffectLayer():void{
			this._stageEffect.destroyChildren();
		}
		/**
		 *  中奖遮罩上添加中奖的元素  ,  相当于画线
		 * @param sp    在遮罩上添加的中奖元素
		 * @param lines  中奖的位置   0，1，2 
		 * 
		 */		
		public function drawSprite(sp:SlotUnitConfig , lines:int):void{
			var s:Image = new Image();
			var url:String = "slots/" + sp.bitMap + ".png";
			s.skin = url;
			this._mask.addChild(s);
			var gapy:int = Math.round((this._itemHeight - s.height)/2);
			s.y = 2*lines * this._containerHeight + gapy;
			s.x = Math.round((this._visibleWidth - s.width)/2);
			
			setMaskSprite(false,lines);
			
		}
		
		/**
		 * 根据icon的图标和位置画中奖的元素和特效 
		 * @param icon   中奖的图片
		 * @param lines  中奖的位置  1，2，3
		 * 
		 */		
		public function drawSpriteById(icon:int , lines:int , handler:Handler=null):void{
			var spr:Image = this._stage.getChildByName(lines.toString()) as Image;
			if(spr){
				if(icon == SlotMain.getInstance().COMMONITEM){
					spr.visible = true;
				}
				return;
			}
			//var act:PlayEffect = new PlayEffect(null ,this.effectLayer,this.effect,lines,true);
//			if(handler){
//				//act.setCallBack(handler);
//				var big:PlayLargeSprite = new PlayLargeSprite(this._stage , lines ,icon);
//				var sqence:SequenceAction = new SequenceAction([big]);
//				
//				ActionManager.getInstance().addAction(sqence).play();
//			}
			
			var addSprite:AddImageAction = new AddImageAction(icon ,lines ,this._stage ,this._itemHeight,this._containerHeight , this._visibleWidth);
			ActionManager.getInstance().addAction(addSprite).play();
			
			setMaskSprite(false,lines);
			
		}
		
		
		/**
		 * 按照位置 显示特效 
		 * @param lines   显示的位置
		 * @param handler
		 * 
		 */		
		public function showEffect(lines:int  , handler:Handler=null):void{
			var spr:Node = this.stageEffect.getChildByName(lines.toString()) as Node;
			if(spr){
				return;
			}
			var act:PlayEffect = new PlayEffect(null ,this.stageEffect,this.effect,lines,true);
			ActionManager.getInstance().addAction(act).play();
		}
		
		
		public function showScaleAnimation(lines,handler:Handler=null):void{
			var scale:ScaleAnimation = new ScaleAnimation(this._stage , lines);
			ActionManager.getInstance().addAction(scale).play();
		}
		
		
		
		public function setMaskSprite(b:Boolean , lines:int):void{
			var container1:Sprite = this._l1.getChildAt(this._endIndex + lines) as Sprite;
			container1.visible = b;
			
			var container2:Sprite = this._l2.getChildAt(this._endIndex + lines) as Sprite;
			container2.visible = b;
		}
		
		public function resetMaskedSprite():void{
			for( var i:int = 0 ; i < 3 ; i++){
				var container1:Sprite = this._l1.getChildAt(this._endIndex + i) as Sprite;
				if(!container1.visible){
					container1.visible = true;
				}
				var container2:Sprite = this._l2.getChildAt(this._endIndex + i) as Sprite;
				if(!container2.visible){
					container2.visible = true;
				}
			}
				
		}
		

		
		public function onTempletComplete(lines:int,templet,icon:int):void{
			var curskeleton:Skeleton = templet.buildArmature(0);
			var x:Number = this._visibleWidth/2 ;
			var y:Number = (this._visibleHeight/3)*lines;
			curskeleton.pivotY =-this._visibleHeight/6;
			curskeleton.pos(x,y);
			curskeleton.blendMode = BlendMode.LIGHT;
			if(curskeleton){
				curskeleton.play(0,true);
				this.effectLayer.addChild(curskeleton);
			}
			
		
			
		}
		
		
		public function onEffectLoaded(lines:int , ani:Animation):void{
			var x:Number = this._visibleWidth/2 ;
			var y:Number = (this._visibleHeight/3)*lines;
			//ani.pivotY =-this._visibleHeight/6;
			ani.pos(-100,-100);
			ani.blendMode = BlendMode.LIGHT;
			if(ani){
				ani.play(0,true);
				this.effectLayer.addChild(ani);
			}
		}
		
		
		/**
		 * 设置 特效层和spriteLayer 的元素隐藏  当进入下一伦的画线时，设置上一轮画线的元素隐藏
		 * @param b
		 * @param line
		 * 
		 */		
		public function setEffectVisible(b:Boolean,line:int):void{
			var spr:Image = this._stage.getChildByName(line.toString()) as Image;
			if(spr){
				spr.visible = b;
			}
			var effect:Skeleton = this.stageEffect.getChildByName(line.toString()) as Skeleton;
			if(effect){
				effect.visible = b;
			}
		}
		
		
		public function stop(handler:Handler=null):void{
			this._scrollStatus = 3;
			
		}
		
	}
}