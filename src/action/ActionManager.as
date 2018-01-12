package action
{
	public class ActionManager
	{
		private static var _instance:ActionManager=null;
		private var _action:Array =[];
		public function ActionManager()
		{
		}
		
		public static function getInstance():ActionManager{
			if(!ActionManager._instance){
				ActionManager._instance = new ActionManager();
			}
			return ActionManager._instance;
		}
		
		
		public function addAction(action):ActionManager{
			this._action.push(action);
			return this;
		}
		
		public function clearAction():void{
			for(var i:int = 0; i < this._action.length; i++){
				var act:Action = this._action[i];
				act.destory();
				
			}
			this._action = [];
		}
		
		public function play():void{
//			for(var i:int = 0 ;i < this._action.length ; i++){
//				var a:Action = this._action.shift();
//				a.start();
//			}
			var a:Action = this._action[this._action.length-1];
			if(a){
				a.start();
			}
		}
		
	}
}