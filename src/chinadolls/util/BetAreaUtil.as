package chinadolls.util
{
	import com.lightUI.utils.MyMath;
	
	import laya.maths.Point;
	import laya.maths.Rectangle;

	public class BetAreaUtil
	{
		public static function getRandomByRectangle(index:uint,rec:Rectangle):Point{
			var recX:int = rec.x;
			var recY:int = rec.y;
			var recW:int = rec.width;
			var recH:int = rec.height;
			if(index == 0){
				recX += 40;
				recY += 40;
				recW -= 50;
				recH -= 60;
			}else if(index == 1){
				recX += 40;
				recY += 20;
				recW -= 50;
				recH -= 60;
			}else if(index == 6){
				recX += 16;
				recY += 40;
				recW -= 50;
				recH -= 60;
			}else if(index  == 7){
				recX += 16;
				recY += 20;
				recW -= 55;
				recH -= 60;
			}else{
				recX += 16;
				recY += 20;
				recW -= 40;
				recH -= 30;
			}
			var x:Number = MyMath.randomIntRange(recX,recX + recW);
			var y:Number = MyMath.randomIntRange(recY,recY + recH);
			return new Point(x,y);
		}
		
	}
}



