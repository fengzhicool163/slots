package slot
{


	
	import com.lightUI.logging.Log;
	
	import laya.events.Event;
	import laya.ui.Image;
	import laya.utils.Browser;
	
	import ui.ui.slots.LineViewUI;
	
	import view.slot.Room;
	
	
	public class SlotLine
	{
		private static var _instance:SlotLine;
		private var _slot:Room;
		private var _line:Array;
		private var _width:Number;
		private var _height:Number;
		public var LINE:Array = [];
		public function SlotLine()
		{
		}
		
		public static function getInstance():SlotLine{
			if(!SlotLine._instance){
				SlotLine._instance = new SlotLine
			}
			return SlotLine._instance;
		}
		
		public function init(slot:Room):void{
			this._slot = slot;
			this._width = this._slot.linepanel.width;
			this._height = this._slot.linepanel.height;
			this._slot.linepanel.mouseEnabled = true;
			this.LINE = [this._slot.line1 , this._slot.line2,this._slot.line3 , this._slot.line4 ,this._slot.line5 ,this._slot.line6 ,this._slot.line7 ,
			this._slot.line8 ,this._slot.line9 ,this._slot.line10 , this._slot.line11 ,this._slot.line12 , this._slot.line13 , this._slot.line14,
			this._slot.line15 , this._slot.line16 , this._slot.line17 , this._slot.line18  , this._slot.line19 ,this._slot.line20 ,this._slot.line21 ,
			this._slot.line22 ,this._slot.line23 ,this._slot.line24 , this._slot.line25];
			initUI();
		
		}
		
		
		public function initUI():void{
			this._line = [this._slot.num0,this._slot.num1,this._slot.num2,this._slot.num3,this._slot.num4,this._slot.num5,this._slot.num6,this._slot.num7,this._slot.num8,
			this._slot.num9,this._slot.num10,this._slot.num11,this._slot.num12,this._slot.num13,this._slot.num14,this._slot.num15 , this._slot.num16,this._slot.num17,
			this._slot.num18,this._slot.num19 , this._slot.num20,this._slot.num21 , this._slot.num22,this._slot.num23,this._slot.num24];
			
			for(var i:int = 0 ; i < this._line.length;i++){
				var cell:LineViewUI = this._line[i];
				cell.linenum.text = (i+1).toString();
				if(Browser.onMobile){
					cell.on(Event.MOUSE_DOWN ,this,this.touchBegan ,[i]);
					cell.on(Event.MOUSE_OUT,this ,this.onMouseOut , [i]);
					cell.on(Event.MOUSE_UP , this , this.touchEnd ,[i]);
				}
				else{
					cell.on(Event.MOUSE_OVER,this , onMouseIn,[i]);
					cell.on(Event.MOUSE_OUT,this,onMouseOut,[i]);
				}
			
			}
		}
		
		public function onMouseIn(index:int):void{
			//Log.debug("Mouse Over=========>",index);
			var sp:Image = this.LINE[index] as Image;
//			var point:Array = [];
//			point.push(0);
//			point.push(0);
//			
//			var first:int = line[0];
//			for(var i:int = 1; i < line.length;i++){
//				var p:int = line[i];
//				var sub:int = p - first;
//				point.push(164*i);
//				point.push(sub*this._height/3);
//			}
			sp.visible = true;
			//this._slot.linepanel.graphics.drawLines(this._width/10+20,this._height/6+first*this._height/3,point,"#ff0000",3);
			//this._slot.linepanel.graphics.drawLine(50,50,300,50,"#ff0000",3);
			this._line[index].unselect.visible = false;
		}
		
		public function onMouseOut(index:int):void{
			//Log.debug("Mouse Out=========>",index);
			//this._slot.linepanel.graphics.clear();
			for(var i:int = 0 ; i< this.LINE.length; i++){
				var sp:Image = this.LINE[i] as Image;
				sp.visible = false;
				this._line[i].unselect.visible = true;
			}
			
		}
		
	
		
		public function touchBegan(index:int):void{
			
			for(var i:int = 0 ; i< this.LINE.length; i++){
				var sp:Image = this.LINE[i] as Image;
				sp.visible = false;
				this._line[i].unselect.visible = true;
			}
			var sp:Image = this.LINE[index] as Image;
			sp.visible = true;
			this._line[index].unselect.visible = false;
		}
		
		public function touchEnd(index:int):void{
			for(var i:int = 0 ; i< this.LINE.length; i++){
				var sp:Image = this.LINE[i] as Image;
				sp.visible = false;
				this._line[i].unselect.visible = true;
			}
			
			
		}
	}
}