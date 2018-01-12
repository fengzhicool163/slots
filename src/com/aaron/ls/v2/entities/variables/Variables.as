package com.aaron.ls.v2.entities.variables
{
	import com.aaron.ls.v2.proto.PVariable;
	import com.aaron.ls.v2.proto.PVariables;

	public class Variables
	{
		public function Variables()
		{
			
		}
		
		public static function creatVariables(proto:PVariables):Object{
			var _map:Object = new Object();
			var pvs:Array = proto.variables;
			var pv:PVariable;
			var v:Variable;
			var l:int = pvs.length;
			for(var i:int = 0; i<l; i++){
				pv = pvs[i];
				v = new Variable();
				v.fromProto(pv);
				_map[v.name] = v;
			}
			return _map;
		}
		
	}
}