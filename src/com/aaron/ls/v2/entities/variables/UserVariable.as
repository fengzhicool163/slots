package com.aaron.ls.v2.entities.variables
{
	import com.aaron.ls.v2.proto.LProto;
	import com.aaron.ls.v2.proto.PVariable;

	public class UserVariable extends Variable implements IUserVariable
	{
		private var _isPrivate:Boolean;
		
		public function UserVariable(name:String = "", value:* = null, type:int=-1)
		{
			super(name, value, type);
		}
		
		override public function toProtobuf(proto:LProto):PVariable{
			var pv:PVariable = super.toProtobuf(proto);
			pv.isPrivate = this.isPrivate;
			return pv;
		}
		
		public function get isPrivate():Boolean
		{
			return _isPrivate;
		}
		
		public function set isPrivate(value:Boolean):void
		{
			_isPrivate = value;
		}
	}
}