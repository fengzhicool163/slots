package action
{
	import laya.utils.Handler;

	public class SequenceAction extends Action
	{
		public var _queue:Array = [];
		public var _actionIndex:int = 0;
		public function SequenceAction(arr:Array)
		{
			super();
			this._queue = arr;
		}
		
		override public function start(complete:Handler=null):void{
			this._complete = complete;
			nextAction();
		}
		
		public function setCallBack(callback:Handler):void{
			this._complete = callback;
		}
		
		public function nextAction():void{
			var item:Action = this._queue[this._actionIndex];
			if(item){
				item.start(new Handler(this , playEnd));
			}
			else{
				this._actionIndex = 0;
				this.done();
				if(this._complete){
					this._complete.run();
				}
			}
		}
		
		
		public function playEnd():void{
			this._actionIndex++;
			nextAction();
		}
		
		override public function destory():void{
			for(var i:int = 0 ; i < this._queue.length;i++){
				var item:Action = this._queue[i];
				item.destory();
			}
			this._queue = [];
		}
	}
}