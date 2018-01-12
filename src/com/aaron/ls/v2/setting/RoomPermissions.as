package com.aaron.ls.v2.setting
{
	import com.aaron.ls.v2.proto.LProto;
	import com.aaron.ls.v2.proto.PRoomPermissions;
	import com.aaron.ls.v2.proto.RoomPermissions;

    public class RoomPermissions extends Object
    {
        private var _allowNameChange:Boolean;
        private var _allowPasswordStateChange:Boolean;
        private var _allowPublicMessages:Boolean;
        private var _allowResizing:Boolean;

        public function RoomPermissions()
        {
           
        }

        public function get allowNameChange() : Boolean
        {
            return this._allowNameChange;
        }

        public function set allowNameChange(param1:Boolean) : void
        {
            this._allowNameChange = param1;
           
        }

        public function get allowPasswordStateChange() : Boolean
        {
            return this._allowPasswordStateChange;
        }

        public function set allowPasswordStateChange(param1:Boolean) : void
        {
            this._allowPasswordStateChange = param1;
           
        }

        public function get allowPublicMessages() : Boolean
        {
            return this._allowPublicMessages;
        }

        public function set allowPublicMessages(param1:Boolean) : void
        {
            this._allowPublicMessages = param1;
           
        }

        public function get allowResizing() : Boolean
        {
            return this._allowResizing;
        }

        public function set allowResizing(param1:Boolean) : void
        {
            this._allowResizing = param1;
           
        }

		public function toProto(proto:LProto):PRoomPermissions{
			var permissions:PRoomPermissions = new PRoomPermissions();
			permissions.allowNameChanges = this.allowNameChange;
			permissions.allowPasswordStateChange = this,allowPasswordStateChange;
			permissions.allowPublicMessage = this.allowPublicMessages;
			permissions.allowResizing = this.allowResizing;
			
			return permissions;
		}
    }
}
