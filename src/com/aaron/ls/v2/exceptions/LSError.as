package com.aaron.ls.v2.exceptions
{

    public class LSError extends Error {

        private var _details:String;
		private var _errors:Array;

        public function LSError(message:String,errors:Array = null, errorId:int=0, extra:String=null){
            super(message, errorId);
            this._details = extra;
			this._errors = errors;
        }
        public function get details():String{
            return (this._details);
        }
		public function get errors():Array{
			return _errors;
		}
    }
}