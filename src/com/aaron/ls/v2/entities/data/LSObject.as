package com.aaron.ls.v2.entities.data
{
	import com.aaron.ls.v2.proto.LProto;
	import com.aaron.ls.v2.proto.PObject;
	import com.aaron.ls.v2.proto.PObjectItem;
	import com.aaron.ls.v2.proto.PObjectType;
	
	import laya.utils.Dictionary;
	
	public class LSObject implements ILSObject
	{
		private var map:Dictionary;
		
		public function LSObject()
		{
			map = new Dictionary();
		}
		
		public function isNull(key:String):Boolean
		{
			var value:Object = getObject(key);
			if(value == null) return true;
			return false;
		}
		
		public function containsKey(key:String):Boolean
		{
			var value:Object = getObject(key);
			if(!value) return false
			return true;
		}
		
		public function removeElement(key:String):void
		{
			
		}
		
		public function getKeys():Array
		{
			return map.keys;
		}
		
		public function size():int
		{
			return map.values.length;
		}
		
		public static function fromProto(proto:PObject):LSObject{
			var newLSObject:LSObject = new LSObject();
			newLSObject.parseProto(proto);
			return newLSObject;
		}
		
		public function parseProto(proto:PObject):void
		{
			doParseProto(proto,this);
		}
		
		private function doParseProto( po:PObject, lso:ILSObject):void {
			var newLso:ILSObject;
			for( var item:PObjectItem in po.item) {
				if(item.type == PObjectType.BOOL){
					lso.put(item.key, item.boolValue);
				}else if(item.type == PObjectType.INT){
					lso.put(item.key,item.intValue);
				}else if(item.type == PObjectType.STRING){
					lso.put(item.key, item.stringVlue);
				}else if(item.type == PObjectType.POBJECT){
					newLso = new LSObject();
					lso.put(item.key, newLso);
					doParseProto(item.objectValue,newLso);
				}else{
					throw new Error("未知的类型");
				}
			}
		}
		
		public function toProto(proto:LProto):PObject
		{
			return doToProto(this,proto);
		}
		
		private function doToProto( lso:ILSObject,proto:LProto):PObject{
			var builder:PObject = proto.getPObject()
			var itemBuilder:PObjectItem = proto.getPObjectItem();
			var o:Object;
			for(var key:String in map.keys){
				o = lso.getObject(key);
				if(o != null){
					itemBuilder.key = key;
					if(o is Boolean){
						itemBuilder.type = PObjectType.BOOL;
						itemBuilder.boolValue = o as Boolean;
					}else if(o is int){
						itemBuilder.type = PObjectType.INT;
						itemBuilder.intValue = o as int;
					}else if(o is String){
						itemBuilder.type = PObjectType.STRING;
						itemBuilder.stringVlue = o as String;
					}else if(o is LSObject){
						itemBuilder.type = PObjectType.POBJECT;
						itemBuilder.objectValue = doToProto(lso,proto);
					}else{
						throw new Error("未知类型");
					}
				}
			}
			return builder;
		}
		
		public function getBool(key:String):Boolean
		{
			return map.get(key);
		}
		
		public function getNunber(key:String):Number
		{
			return map.get(key);
		}
		
		public function getString(key:*):String
		{
			return map.get(key);
		}
		
		public function getInt(key:String):int
		{
			return map.get(key);
		}
		
		public function getObject(key:String):Object
		{
			return map.get(key);
		}
		
		public function getLSObject(key:String):Object
		{
			return map.get(key);
		}
		
		public function putNull(key:String):void
		{
		}
		
		public function remove(key:String):Object
		{
			return map.remove(key);
		}
		
		public function put(key:String, param:Object):void
		{
			map.set(key,param);
		}
	}
}