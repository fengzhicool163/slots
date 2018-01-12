package action
{
	import laya.utils.Handler;

	public class Action
	{
		public var _target:*;
		public var _complete:Handler;
		public function Action()
		{
		}
		
		public function start(complete:Handler=null):void{
			this._complete = complete;
		}
		
		public function stop():void{
			
		}
		
		public function destory():void{
			
		}
		
		public function next():void{
			//this._complete.run();
		}
		
		public function done():Boolean{
			return true;
		}
	}
}