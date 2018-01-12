package com.aaron.ls.v2.setting
{
	import com.aaron.ls.v2.proto.LProto;
	import com.aaron.ls.v2.proto.PRoomExtension;
	import com.aaron.ls.v2.proto.RoomEvents;
	import com.aaron.ls.v2.proto.RoomExtension;

    public class RoomExtension extends Object
    {
        private var _id:String;
        private var _className:String;
        private var _propertiesFile:String;

        public function RoomExtension(param1:String, param2:String)
        {
            this._id = param1;
            this._className = param2;
            this._propertiesFile = "";
            return;
        }

        public function get id() : String
        {
            return this._id;
        }

        public function get className() : String
        {
            return this._className;
        }

        public function get propertiesFile() : String
        {
            return this._propertiesFile;
        }

        public function set propertiesFile(param1:String) : void
        {
            this._propertiesFile = param1;
        }
		
		public function toProto(proto:LProto):PRoomExtension{
			var extension:PRoomExtension = new PRoomExtension();
			extension.id = this.id;
			extension.calssname = this.className;
			extension.propertiesFile = this.propertiesFile;
			return extension;
		}
    }
}
