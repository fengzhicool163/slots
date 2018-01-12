package com.aaron.ls.v2.entities.variables
{
	public interface IRoomVariable extends IUserVariable
	{
		function get isPersistent():Boolean;
		function set isPersistent(value:Boolean):void;
	}
}