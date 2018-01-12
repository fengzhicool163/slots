package chinadolls.model.param
{
	import com.IProtobuf.Message;
	
	import chinadolls.proto.GameResult;
	
	import slot.SlotMain;

	public class SlotResultParam
	{
		public var isBonus:Boolean=false;
		public var gameResult:GameResult;
		public var balance:int = 0;
		public var freeGameResult:Array;
		public function SlotResultParam(gameResult:* , balance:int, freeGameResult:Array,isBonus:Boolean)
		{
			this.gameResult = gameResult;
			this.balance = balance;
			this.freeGameResult = freeGameResult;
			this.isBonus = isBonus;
		}
		
		public function getResultGrid():Array{
			return (this.gameResult as GameResult).resultGrid;
		}
		
		public function getWinAmount():Number{
			return this.gameResult.winAmount;
		}
		
		
		public function getIsBonus():Boolean{
			return this.isBonus;
		}
		
		public function getwinLines():Array{
			return this.gameResult.winLines;
		}
		
		public function getBalance():int{
			return this.balance;
		}
		
		public function getFreeGameResult():Array{
			return this.freeGameResult;
		}
		
		public function IsFreeTime():Boolean{
			return this.gameResult.isFreeTime;
		}
		
		public function IsFreeGameResult():Boolean{
			if(this.freeGameResult){
				return this.freeGameResult.length;
			}
			return false;
		}
		
		public function ISBonus():Boolean{
			return this.isBonus;
		}
		
		/**
		 *  过滤有多少种中奖的元素  可能中了3条线 都是一种元素，那么 return 一个元素，  
		 * 比如中了，1，3，5号线，每条线中的元素都是8号元素，那么只返回一个 8  return [8];
		 * 如果中了，2，23，10 号线， 2和23号线中的6号元素，10号线中了8号元素那么返回  [6,8]; 
		 * @return 
		 * 
		 */		
		public function filterIcon():Array{
			var arr:Array = getwinLines();
			var num:int = arr.length;
			var tempArr:Array = [];
			for(var i:int ; i < num ; i++){
				var item:* =  arr[i];
				if(tempArr.indexOf(item.icon) ==-1){
					tempArr.push(item.icon);
				}
			}
			
			return tempArr;
		}
		
		
		public function findLinesShowBigImage(rewardIcon):Object{
			var arr:Array = filterIcon();
			var grid:Array = getwinLines();
			var y:int = 0;
			var count:int = 3;
			for(var j:int = 0 ; j < grid.length; j++){
				var item:* = grid[j];
				if(rewardIcon == item.icon){
					var lines:int = item.lineid;
					count = item.count>3 ? 3:count;
					var tempY = SlotMain.getInstance().LINES[lines-1][count-1];
					if(tempY > y){
						y = tempY;
					}
					var cell:int = this.getResultGrid()[y*5+2];
					if(cell==SlotMain.getInstance().COMMONITEM){
						rewardIcon = SlotMain.getInstance().COMMONITEM;
					}
				}
					
			}
			var obj:Object = new Object();
			obj.x = 2;
			obj.y = y;
			obj.icon = rewardIcon;
			
			
			return obj;
		}
		
		
		/**
		 * 根据 元素icon 找到 所有中奖的icon 的元素的坐标，x == this.scroller[i] , y== this._LINES[i] 
		 * @param icon  中奖的元素
		 * 
		 */		
		public function findItemByIcon(icon:int):Array{
			var winLineArr:Array = getwinLines();
			var tempArr:Array =[];
			for(var i:int = 0 ;  i < winLineArr.length; i++){
				var item:Object = winLineArr[i];
				if(item.icon == icon){
					var num:int = item.count;
					var lineid:int = item.lineid;
					for(var j:int = 0 ; j < num; j++){
						var obj:Object = new Object();
						obj.x = j;
						obj.y = SlotMain.getInstance().LINES[lineid-1][j];
						var flag:Boolean = tempArr.some(function(cell,index,arr){
							if(cell.x == obj.x && cell.y == obj.y){
								return true;
							}
							else{
								return false;
							}
						});
						if(!flag){
							tempArr.push(obj);
						}
						
					}
				}
			}
			return tempArr;
		}
		
		
		public function numbersOfTwo():int{
			var n:int = 0;
			for(var i:int = 0 ; i < this.getResultGrid().length;i++){
				var cell:int =  this.getResultGrid()[i];
				if(cell == 2){
					n++;
				}
			}
			return n;
		}
		
		public function howManyEffect():Object{
			var num:int = 1;
			var obj:Object = new Object();
			obj.start = 0;
			var arr:Array = this.getResultGrid();
			for(var i:int = 0 ; i < 4; i++){
				for(var j:int = i+1;j<5;j++){
					var a1:int = arr[j-1];
					var a2:int = arr[j];
					if(a1==a2){
						var b1:int = arr[j-1+5];
						var b2:int = arr[j+5];
						if(b1 == b2){
							var c1:int = arr[j-1+10];
							var c2:int = arr[j+10];
							if(c1==c2){
								num++;
								obj.start = j;
							}
							else{
								break;
							}
						}
						else{
							break;
						}
					}
					else{
						break;
					}
				}
				if(num>1){
					break;
				}
			}
			obj.num = num;
			return obj;
		}
		
		
		public function findSomeElement(icon):Array{
			var arr:Array = [];
			var result:Array = this.getResultGrid();
			for(var i:int = 0 ; i < result.length; i++){
				var num:int = result[i];
				if(num == icon){
					arr.push(i);
				}
			}
			return arr;
		}
	}
	
	
	
}