package com.aaron.ls.v2.entities.variables
{
	public interface IUserVariable extends IVariable
	{
		function get isPrivate():Boolean;
		function set isPrivate(value:Boolean):void;
	}
}