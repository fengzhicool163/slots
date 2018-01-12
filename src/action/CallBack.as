package action
{
	import laya.utils.Handler;

	public class CallBack extends Action
	{
		private var _callback:Handler;
		public function CallBack(callback:Handler)
		{
			super();
			this._callback = callback;
		}
		
		override public function start(handler:Handler=null):void{
			this._complete = handler;
			if(this._callback){
				this._callback.run();
			}
		}
		
		
	}
}