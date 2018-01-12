package slot
{
	import com.IProtobuf.Message;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.core.Light;
	import com.lightUI.logging.Log;
	import com.lightUI.manager.timer.Timer;
	
	import action.ActionManager;
	import action.CallBack;
	import action.PlayAnimationBox;
	import action.PlayEffect;
	import action.PlayLargeSprite;
	import action.SequenceAction;
	
	import chinadolls.consts.GameNotification;
	import chinadolls.consts.RoomStatus;
	import chinadolls.mediator.RoomMediator;
	import chinadolls.model.MySoundManager;
	import chinadolls.model.data.RoomData;
	import chinadolls.model.data.UserInfoData;
	import chinadolls.model.param.SlotResultParam;
	import chinadolls.proto.GameResult;
	
	import laya.display.Sprite;
	import laya.ui.Image;
	import laya.utils.Handler;
	import laya.utils.TimeLine;
	
	import view.slot.Room;
	
	

	public class SlotMain  extends Mediator implements IMediator
	{
		private static var _instance:SlotMain;
		public static const NAME:String = "SlotMain";
		private var _slot:*;
		private var _timer:Timer;
		private var _MATRIX:int =5;     //矩阵的列数
		private var UNIT_ITEMS:Array = ["icon_1" , "icon_2","icon_3" , "icon_4","icon_5","icon_6","icon_7","icon_8","icon_9","icon_10","icon_11"];
		private var UNIT_ITEMS_BLUR:Array =  ["icon_1_b" , "icon_2_b","icon_3_b" , "icon_4_b","icon_5_b","icon_6_b","icon_7_b","icon_8_b","icon_9_b","icon_10_b","icon_11_b"];
		private var _runIndex:int=-1;    // 当前转到第几个元素
		private var _resultIndex:int = -1; 
		private var _allStarted:Boolean = false;
		private var _scroller:Array = [];
		public static var _wheelResult:Array = [];
		private var _stopNum:int = 0;
		private static var _slotResult:SlotResultParam;
		private var _callback:Handler;
		public static var running:Boolean = false;    // 当前是否在旋转状态
		public var LINE1:Array = [0,0,0,0,0];
		public var LINE2:Array = [0,1,2,1,0];
		public var LINE3:Array = [0,0,1,0,0];
		public var LINE4:Array = [0,1,0,1,0];
		public var LINE5:Array = [1,1,1,1,1];
		public var LINE6:Array = [1,0,0,0,1];
		public var LINE7:Array = [1,2,2,2,1];
		public var LINE8:Array = [1,0,1,0,1];
		public var LINE9:Array = [2,2,2,2,2];
		public var LINE10:Array= [2,1,0,1,2];
		public var LINE11:Array= [2,2,1,2,2];
		public var LINE12:Array= [2,1,2,1,2];
		public var LINE13:Array= [0,1,1,1,0];
		public var LINE14:Array= [0,1,2,2,2];
		public var LINE15:Array= [0,2,0,2,0];
		public var LINE16:Array= [0,0,1,2,2];
		public var LINE17:Array= [1,2,1,2,1];
		public var LINE18:Array= [1,1,0,1,1];
		public var LINE19:Array= [1,1,2,1,1];
		public var LINE20:Array= [1,0,2,0,1];
		public var LINE21:Array= [2,1,1,1,2];
		public var LINE22:Array= [2,1,0,0,0];
		public var LINE23:Array= [2,0,2,0,2];
		public var LINE24:Array= [2,2,1,0,0];
		public var LINE25:Array= [1,2,0,2,1];
		public const COMMONITEM:int = 1;
		public  var LINES:Array = [LINE1,LINE2,LINE3,LINE4,LINE5,LINE6,LINE7,LINE8,LINE9,LINE10,LINE11,LINE12,LINE13,LINE14,LINE15,LINE16,LINE17,
		LINE18,LINE19,LINE20,LINE21,LINE22,LINE23,LINE24,LINE25];
//		public var LINES:Array = [LINE1,LINE5 , LINE9,LINE2,LINE10,LINE3,LINE11 ,LINE6,LINE7,LINE8 ,LINE17,LINE4,LINE12,LINE18,LINE19,LINE13,LINE21,LINE14,LINE22,LINE15,
//			LINE23,LINE20,LINE25,LINE16,LINE24];
		private var _slotStatus:int = 0;   // 旋转模式，0是正常模式，1是快速模式
		private var _drawLines:int = 0 ;   //中奖需要画的线数
		private var _allSprite:Array=[];    // 记录 中奖元素的 坐标{x:0,y:1};   x:0--4,y:0--2;
		private var _loopEffectIndex:int = 0;
		//private var _isSpeed:Boolean = false;    // 是否加速
		private var _roomData:RoomData = null;
		
		private static var _count:int = 0;
		public function SlotMain(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
			_instance = this;
		}
		
		public function get allStarted():Boolean
		{
			return _allStarted;
		}

		public function set allStarted(value:Boolean):void
		{
			_allStarted = value;
		}

		public static function getInstance():SlotMain{
			if (!_instance) {
				
				_instance=new SlotMain();
				
			}
			return _instance;
		}
		
		public function init(view:* , roomData:RoomData = null):void{
			this._slot = view;
			//initSprite();
			this._roomData = roomData;
			this._timer = new Timer();
			this.addNotifiction(GameNotification.SLOT_RESULT);
			getTestData();
		}
		
		public function getRoomData():RoomData{
			return this._roomData;
		}
		
		
		public function getView():Room{
			return this._slot;
		}
		
		
		override public function handler(notification:INotification):void{
			Log.debug("BetCommand "," _count: ",_count,notification.getBody())
			if(notification.getName() == GameNotification.SLOT_RESULT .toString()){
				var self:Room = this.getView();
				onSlotResult(notification.getBody() as SlotResultParam)
			}
		}
		
		public function initSprite():void{
			var bg:Image = new Image();
			var url:String = "slots/icon_1.png";
			bg.source =  Light.loader.getRes(url);
			bg.x = 20;
			bg.y = 50;
			var container:Sprite = new Sprite();
			container.width = this._slot.box0.width;
			container.height = this._slot.box0.height;
			container.addChild(bg);
			//container.graphics.drawRect(0,0,this._slot.box0.width,this._slot.box0.height,0x000000,0);
			//l1.addChild(bg);
			this._slot.box0.addChild(container);
//			imag.x = 0;
//			imag.y = -20;
//			imag.loadImage("slots/icon_1.png");
		}
		
		
		public function random():int{
			var length:int = this.UNIT_ITEMS.length-1;
			var num:int = Math.round(Math.random()*length);
			return num ;
		}
		
		public function getTestData():*{
			var config:Array =[];
			for(var i:int = 0 ; i < 11 ; i++){
				
				var num:int = random();
				//var num:int = 2;
				var unitConfig:SlotUnitConfig = new SlotUnitConfig(this.UNIT_ITEMS[num] ,this.UNIT_ITEMS_BLUR[num]);
				config.push(unitConfig);
			}
			var slotScoller:SlotScroller = new SlotScroller(config , this._slot.box0.width , this._slot.box0.height , 3);
			slotScoller.setStage(this._slot.boxsprite0);
			slotScoller.stageEffect = this._slot.boxeffect0;
			this._scroller.push(slotScoller);
			this._slot.box0.addChild(slotScoller);
			
			var slotScroller1:SlotScroller = new SlotScroller(config, this._slot.box1.width , this._slot.box1.height,3);
			slotScroller1.setStage(this._slot.boxsprite1);
			slotScroller1.stageEffect = this._slot.boxeffect1;
			this._slot.box1.addChild(slotScroller1);
			this._scroller.push(slotScroller1);
			
			var slotScroller2:SlotScroller = new SlotScroller(config, this._slot.box2.width , this._slot.box2.height,3);
			slotScroller2.setStage(this._slot.boxsprite2);
			slotScroller2.stageEffect = this._slot.boxeffect2;
			this._slot.box2.addChild(slotScroller2);
			this._scroller.push(slotScroller2);
			
			
			var slotScroller3:SlotScroller = new SlotScroller(config, this._slot.box3.width , this._slot.box3.height,3);
			slotScroller3.setStage(this._slot.boxsprite3);
			slotScroller3.stageEffect = this._slot.boxeffect3;
			this._slot.box3.addChild(slotScroller3);
			this._scroller.push(slotScroller3);
			
			var slotScroller4:SlotScroller = new SlotScroller(config, this._slot.box4.width , this._slot.box4.height,3);
			slotScroller4.setStage(this._slot.boxsprite4);
			slotScroller4.stageEffect = this._slot.boxeffect4;
			this._slot.box4.addChild(slotScroller4);
			this._scroller.push(slotScroller4);
			
		}
		
		
		public function onSlot(handler:Handler=null , speed:Boolean = false):void{
			this._callback = handler;
			this._resultIndex = -1;
			this._runIndex = -1;
			this._allStarted = false;
			this._stopNum = 0;
			SlotMain.running = true;
			SlotMain._wheelResult = [];
			SlotMain._slotResult = null;
			this._timer.clearAllIntercal();
			this._timer.clearAllTimeout();
			this._allSprite = [];
			this._drawLines = 0;
			
			ActionManager.getInstance().clearAction();
			this.setMaskVisible(false);
			
			this.clearLines();
			
			this.run();
		}
		
		public function run():void{
			this._runIndex++;
			if(this._scroller.length >= (this._runIndex+1)){
				var scroller:SlotScroller = this._scroller[this._runIndex];
				scroller.start(this.onSlotEnd , this,this._roomData.speed);
				var timeout:Number = this._timer.setTimeout(this ,timeoutCall,200 ,null);
				
			}
			else{
				this._allStarted = true;
				this.setResult();
			}
		}
		
		public function loopResult():void{
			this._resultIndex++;
			if(this._scroller.length >= (this._resultIndex+1)){
				var scroller:SlotScroller = this._scroller[this._resultIndex];
				scroller.setResult(SlotMain._wheelResult[this._resultIndex]);
				this._timer.setTimeout(this , this.loopResultTimeout ,200 , null);
			}
		}
		
		public function setStopResult():void{
			for(var i:int = 0 ; i < this._scroller.length; i++){
				var scroller:SlotScroller = this._scroller[i];
				scroller.setResult(SlotMain._wheelResult[i]);
			}
		}
		
		
		public function timeoutCall():void{
			//this._timer.clearAllTimeout();
			this.run();
		}
		
		public function loopResultTimeout():void{
			this.loopResult();
		}
		
		/**
		 * 摇奖的结果数据处理函数 
		 * 
		 */		
		public function onSlotResult(result:SlotResultParam):void{
			Log.debug("SlotMain onSlotResult===========>" , result);
			var gameResult:Array = result.getResultGrid();
			
			SlotMain._slotResult = result;	
	
			var arr:Array;
			for( var j:int = 0 ; j < 5; j++){
				arr = new Array();
				for( var i:int = 0 ; i < 3; i++){
					var bgIndex:int = gameResult[i*5+j];
					var slotUnitcongig:SlotUnitConfig = new SlotUnitConfig(this.UNIT_ITEMS[bgIndex-1],this.UNIT_ITEMS_BLUR[bgIndex-1]);
					arr.push(slotUnitcongig);
				}
				SlotMain._wheelResult.push(arr);
			}
			this.setResult();
			SlotSoundLogic.getInstance().playSymbolTwo();
			
		}
		
		
		public function setResult():void{
			if(this._allStarted && SlotMain._wheelResult.length){
				getView().dock.btn_stop.disabled = false;
				var obj:Object = SlotMain._slotResult.howManyEffect();
				var num:int = obj.num;
				if(num > 1){
					var start:int = obj.start;
					for(var k:int = 0 ; k < num;k++){
						var s:String = "boxeffect" + (start-k);
						var name:String = "effects_ani0" +(5+num).toString();
						var effect:PlayAnimationBox = new PlayAnimationBox(null ,this._slot[s],name,1,true);
						ActionManager.getInstance().addAction(effect).play();
					}
				}
				this.loopResult();
			}
		}
		
		
		/**
		 *  转轮旋转结束后的 回调处理，如果中奖就画线，然后结束 返回上级的回调 
		 * 
		 */		
		public function onSlotEnd():void{
			Log.debug("SlotMain onEnd=========>");
			
			this._stopNum++;
			var arr:Array = SlotMain._slotResult.getwinLines();
			if(this._stopNum == this._scroller.length){
				this.clearEffect();
				if(arr.length){
					var b:Boolean = this._roomData.speed &&(this._roomData.status == RoomStatus.ROOM_COMMON || this._roomData.status == RoomStatus.ROOM_AUTO);
					if(!b){
					
						SlotSoundLogic.getInstance().playRewardTrigger();
						setMaskVisible(true);
						
						onEndDraw();
					}
					else{
						onEnd();
					}
				}
				else{
					onEnd();
				}
			
				
			}
		}
		
		
		/**
		 *所有的动作执行完成后，回掉上级处理 
		 * 
		 */
		public function onEnd():void{
			MySoundManager.getInstance().playVoiceSound("stop");
			//sentNotification(GameNotification.SLOT_COMPLETE_REWARD);
			SlotMain.running = false;
			if(this._callback){
				this._callback.run();
				//this._callback = null;
			}
//			if(this._timer){
//				this._timer.clearAllTimeout();
//			}
		}
		
		
		/**
		 * 摇奖结束时 画线的逻辑处理 
		 * 
		 */		
		public function onEndDraw():void{
			var arr:Array = SlotMain._slotResult.getwinLines();
			var filterArr:Array = SlotMain._slotResult.filterIcon();
			if(arr.length){
				if(this._drawLines < filterArr.length){
					if(this._drawLines >0){
						var ic:int = filterArr[this._drawLines -1];
						this.setEffectVisible(false ,ic);
					}
					var tempIcon:int = filterArr[this._drawLines];
					var tempShow:Object = SlotMain._slotResult.findLinesShowBigImage(tempIcon);
					var bool:Boolean = true;
					for(var i:int = 0; i < arr.length; i++){
						var icon:int = arr[i].icon;
						if(icon == tempIcon){
							var lines:int = arr[i].lineid;
							var count:int = arr[i].count;
							Log.debug("SlotMain onSlotEnd lineid:" ,lines,"count:" ,count);
						
							drawLines(this.LINES[lines-1] , count,icon);
		
						}
					
					}
					
					var scroller:SlotScroller = this._scroller[2];
					(scroller.getStage().getChildByName(tempShow.y.toString()) as Image).visible = false;
					var big:PlayLargeSprite = new PlayLargeSprite(this._slot.bigSprite , tempShow.y ,tempShow.icon);
					var callback:CallBack = new CallBack(Handler.create(this , function(scr,name):void{
						var spr:Image = (scr.getStage().getChildByName(name) as Image);
						if(spr){
							spr.visible = true;
						}
					} , [scroller ,tempShow.y.toString()]));
					
					var sqence:SequenceAction = new SequenceAction([big , callback]);
					
					ActionManager.getInstance().addAction(sqence).play();
					var scale:Number = 1;
					if((this._roomData.status == RoomStatus.ROOM_FREE_GAME)&& (tempShow.y==1)){
						scale = 2;
					}
					var effect:PlayAnimationBox = new PlayAnimationBox(null ,this._slot.boxeffect2,"effects_ani01",tempShow.y,false,scale);
					effect.setCallBack(new Handler(this , showLineEffect,[tempIcon]));
					ActionManager.getInstance().addAction(effect).play();
					
				}
				else{
					onEnd();
					if(this._drawLines > 0){
						this._timer.setInterval(this ,loopEffect,3000,null);
						
					}
					this._drawLines = 0;
					
					
				}
			}
		}
		
		
		public function getCurLine():int{
			return this._drawLines;
		}
		
		public function nextDraw():void{
			this._drawLines++;
			onEndDraw();
		}
		
		/**
		 * 画线
		 * @param lines 中奖的线的数据    
		 * @param num  本条线上中奖的元素个数
		 * 
		 */		
		public function drawLines(lines:Array ,num:int , icon:int, handler:Handler=null):void{
			var ic:int = icon;
			for(var i:int = 0; i < num; i++){
				var index:int = lines[i];
				var scroller:SlotScroller = this._scroller[i];
				var item:int = SlotMain._slotResult.getResultGrid()[(index*5)+i];
				if(item == this.COMMONITEM){
					icon = this.COMMONITEM;
				}
				else{
					icon = ic;
				}
				scroller.drawSpriteById(icon , index);
				
//				var obj:Object = new Object();
//				obj.x = i;
//				obj.y = index;
//				this._allSprite.push(obj);
			}
			
			
		}
		
		
		/**
		 *  遍历 中奖线上的中奖元素的，显示特效 
		 * icon    中奖的元素
		 */		
		public function showLineEffect(icon:int):void{
			var arr:Array = SlotMain._slotResult.findItemByIcon(icon);
			for(var i:int = 0 ; i < arr.length; i++){
				var item:Object = arr[i];
				var scroller:SlotScroller = this._scroller[item.x];
				scroller.showEffect(item.y);
			}
			showScaleAmiation(icon);
			this._timer.setTimeout(this , nextDraw,1000,null);
			//nextDraw();
		}
		
		
		
		
		public function showScaleAmiation(icon:int):void{
			var arr:Array = SlotMain._slotResult.getwinLines();
			var iconArr:Array = SlotMain._slotResult.findItemByIcon(icon);
			for(var i:int = 0; i < iconArr.length; i++){
				var item:Object = iconArr[i];
				var scroller:SlotScroller = this._scroller[item.x];
				scroller.showScaleAnimation(item.y);
			}
		}
		
		
		/**
		 *  设置中奖的元素是否隐藏，画下一条线时，隐藏上一条线的元素和特效
		 * 这里包括隐藏spriteLayer,和effectLayer的东西，同时还要显示遮罩下面的元素 
		 * @param b
		 *  @param icon   上一轮画的元素
		 */		
		public function setEffectVisible(b:Boolean,icon:int):void{
			var arr:Array = SlotMain._slotResult.findItemByIcon(icon);
			for(var i:int = 0 ; i < arr.length ; i++){
				var item:Object = arr[i];
				var scroller:SlotScroller = this._scroller[item.x];
				scroller.setEffectVisible(b,item.y);
				scroller.setMaskSprite(!b,item.y);
			}
		}
		
	
		
		public function loopEffect():void{
			var arr:Array = SlotMain._slotResult.filterIcon();
			var icon:int = arr[this._loopEffectIndex];
			var i:int = 0;
			if(this._loopEffectIndex<=0){
				i = arr[arr.length-1];
				
			}
			else{
				i = arr[this._loopEffectIndex - 1];
			}
			setEffectVisible(false,i);
			this._loopEffectIndex = (this._loopEffectIndex+1)%arr.length;
			setEffectVisible(true,icon);
			
		}
		
	
		/**
		 *  开始下一轮时 消除画线的数据 
		 * @param lines
		 * 
		 */		
		public function clearLines():void{
			
			for(var i:int = 0; i < this._scroller.length; i++){
				var sp:SlotScroller = this._scroller[i];
				sp.resetMaskedSprite();
				sp.setMaskVisible(false);
			}
		}
		
		public function setMaskVisible(b:Boolean):void{
			for( var i:int ; i < this._scroller.length; i++){
				var sp:SlotScroller = this._scroller[i];
				sp.setMaskVisible(b);
			}
			
		}
		
		
		public function clearEffect():void{
			for( var i:int ; i < this._scroller.length; i++){
				var sp:SlotScroller = this._scroller[i];
				sp.clearEffectLayer();
			}
		}
		
		public function getResult():Array{
			Log.debug("SlotMian getSlotResult ===========>" ,SlotMain._wheelResult.length);
			return SlotMain._wheelResult;
		}
		
		
		public static function getSlotResult():SlotResultParam{
			return SlotMain._slotResult;
		}
		
//		public function set slotResult(result:*):void{
//			this._slotResult = result;
//		}
//		
//		public function get slotResult():SlotResultParam{
//			return this._slotResult;
//		}
		
		public function onStop():void{
			if(this._roomData.status == RoomStatus.ROOM_AUTO){
				this._roomData.status = RoomStatus.ROOM_COMMON;
				this._roomData.untill = false;
				this._roomData.autoSlotNum = 0;
			}
			for(var i:int = 0 ; i < this._scroller.length; i++){
				var scroller:SlotScroller = this._scroller[i];
				scroller.stop();
			}
			
		}
		
		
		public function showLargeElement(gridY:int , icon:int,handler:Handler = null):void{
			var x:int = gridY % 5;
			var y:int = Math.floor(gridY/5) ;
			var scroller:SlotScroller = this._scroller[x];
			//scroller.drawSpriteById(icon,y);
			var img:Image = (scroller.getStage().getChildByName(y.toString()) as Image);
			if(img){
				img.visible = false;
			}
				scroller.setMaskSprite(false,y);
				
				var big:PlayLargeSprite = new PlayLargeSprite(scroller.getStage() , y ,icon);
				//big.autoRemove = true;
				big.baseScale=0.8;
				big.endScale = 0.6;
				var callback:CallBack = new CallBack(Handler.create(this,function(s):void{
						s.setMaskSprite(true,y);
					}(scroller)));
				
				
				var sqence:SequenceAction = new SequenceAction([big , callback]);
				ActionManager.getInstance().addAction(sqence).play();
			
				//sentNotification(GameNotification.SLOT_SHOW_BONUS);
			
		}
		
		
		
	}
}