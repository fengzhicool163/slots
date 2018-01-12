package com.aaron.ls.v2.entities.variables
{
	public class RoomVarible extends UserVariable implements IRoomVariable
	{
		private var _isPersistent:Boolean;

		public function get isPersistent():Boolean
		{
			return _isPersistent;
		}

		public function set isPersistent(value:Boolean):void
		{
			_isPersistent = value;
		}

		
		public function RoomVarible(name:String = "", value:* = null, type:int=-1)
		{
			super(name, value, type);
		}
	}
}