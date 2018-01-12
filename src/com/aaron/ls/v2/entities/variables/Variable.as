package com.aaron.ls.v2.entities.variables
{
	import com.IProtobuf.Long;
	import com.aaron.ls.v2.entities.data.ILSObject;
	import com.aaron.ls.v2.entities.data.LSObject;
	import com.aaron.ls.v2.proto.LProto;
	import com.aaron.ls.v2.proto.PObjectItem;
	import com.aaron.ls.v2.proto.PObjectType;
	import com.aaron.ls.v2.proto.PVariable;
	
	import laya.utils.Byte;
	
	public class Variable implements IVariable
	{
		private var _name:String;
		private var _type:int;
		private var _value:*;
		
		public function Variable(name:String = "", value = null, type:int = -1)
		{
			if(!value) return;
			this._name = name;
			if(type > -1){
				this._value = value;
				this._type = type;
			}else{
				this.setValue(value);
			}
		}
		
		public function fromProto(proto:PVariable):void{
			_type = proto.type;
			_name = proto.key;
			if(_type == PObjectType.NULL){
				_value = null;
			}else if(_type == PObjectType.BOOL){
				_value = proto.boolValue;
			}else if(_type == PObjectType.BYTE){
				_value = proto.bytesValue;
			}else if(_type == PObjectType.INT){
				_value = proto.intValue;
			}else if(_type == PObjectType.LONG){
				_value = proto.longValue;
			}else if(_type == PObjectType.FLOAT){
				_value = proto.floatValue;
			}else if(_type == PObjectType.DOUBLE){
				_value = proto.doubleVlue;
			}else if(_type == PObjectType.STRING){
				_value = proto.stringVlue;
			}else if(_type == PObjectType.BOOL_ARRAY){
				_value = proto.boolValues;
			}else if(_type == PObjectType.BYTE_ARRAY){
				_value = proto.bytesValues;
			}else if(_type == PObjectType.INT_ARRAY){
				_value = proto.intValues;
			}else if(_type == PObjectType.LONG_ARRAY){
				_value = proto.longValues;
			}else if(_type == PObjectType.FLOAT_ARRAY){
				_value = proto.floatValues;
			}else if(_type == PObjectType.DOUBLE_ARRAY){
				_value = proto.doubleVlues;
			}else if(_type == PObjectType.STRING_ARRAY){
				_value = proto.stringVlues;
			}else if(_type == PObjectType.POBJECT){
				var lso:LSObject = new LSObject();
				lso.parseProto(proto.objectValue);
				_value = lso;
			}else if(_type == PObjectType.PARRAY){
				_value = lso;
			}else{
				throw new Error("暂时不支持此类型");
			}
			
		}
		
		private function creatArray(vars:Array):Array{
			var re:Array = [];
			var l:int = vars.length;
			var item:PVariable;
			var v:Variable;
			for(var i:int = 0; i<l; i++){
				item = vars[i];
				v = new Variable();
				v.fromProto(item);
				re.push(v);
			}
			return null;
		}
		
		private function setValue(value:*):void{
			_value = value;
			if(value == null){
				this._type = PObjectType.NULL;
			}else if(value is Boolean){
				_type = PObjectType.BOOL;
			}else if(value is Byte){
				_type = PObjectType.BYTE;
			}else if(value is int){
				_type = PObjectType.INT;
			}else if(value is Long){
				_type = PObjectType.LONG;
			}else if(value is Float32Array){
				_type = PObjectType.FLOAT;
			}else if(value is Number){
				_type = PObjectType.DOUBLE;
			}else if(value is String){
				_type = PObjectType.STRING;
			}else if(value is LSObject){
				_type = PObjectType.POBJECT;
			}else if(value is Array){
				throw new Error("传入的是数组类型 请选择type");
			}
		}
		
		public function toProtobuf(proto:LProto):PVariable{
			var pv:PVariable = proto.getPVariable();
			pv.key = name;
			pv.type = type;
			if(_type == PObjectType.NULL){
				
			}else if(_type == PObjectType.BOOL){
				pv.boolValue = _value;
			}else if(_type == PObjectType.BYTE){
				pv.bytesValue = _value;
			}else if(_type == PObjectType.INT){
				pv.intValue = _value;
			}else if(_type == PObjectType.LONG){
				pv.longValue = _value;
			}else if(_type == PObjectType.FLOAT){
				pv.floatValue = _value;
			}else if(_type == PObjectType.DOUBLE){
				pv.doubleVlue = _value;
			}else if(_type == PObjectType.STRING){
				pv.stringVlue = _value;
			}else if(_type == PObjectType.POBJECT){
				pv.objectValue = _value;
			}else if(_type == PObjectType.BOOL_ARRAY){
				pv.boolValue = _value;
			}else if(_type == PObjectType.BYTE_ARRAY){
				pv.bytesValues = _value;
			}else if(_type == PObjectType.INT_ARRAY){
				pv.intValues = _value;
			}else if(_type == PObjectType.LONG_ARRAY){
				pv.longValues = _value;
			}else if(_type == PObjectType.FLOAT_ARRAY){
				pv.floatValues = _value;
			}else if(_type == PObjectType.DOUBLE_ARRAY){
				pv.doubleVlues = _value;
			}else if(_type == PObjectType.STRING_ARRAY){
				pv.stringVlues = _value;
			}
			return pv;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get type():int
		{
			return _type;
		}
		
		public function getValue():*
		{
			return _value;
		}
		
		public function getBoolValue():Boolean
		{
			return _value as Boolean;
		}
		
		public function getBytesValue():Byte
		{
			return _value as Byte;
		}
		
		public function getIntValue():int
		{
			return _value as int;
		}
		
		public function getLoneValue():Long
		{
			return _value as Long;
		}
		
		public function getDoubleValue():Number
		{
			return _value as Number;
		}
		
		public function getStringValue():String
		{
			return _value as String;
		}
		
		public function getLSObjectValue():ILSObject
		{
			return _value as ILSObject;
		}
		
		public function getArrayValue():Array{
			return _value as Array;
		}
		
		public function isNull():Boolean
		{
			return false;
		}
		
		public function toString():String{
			return "{name:"+name+",type:"+type+",value:"+_value+"}"
		}
	}
}