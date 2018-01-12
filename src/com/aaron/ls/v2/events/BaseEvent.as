//Created by Action Script Viewer - http://www.buraks.com/asv
package com.aaron.ls.v2.events
{
	import com.iflash.events.Event;

   	public class BaseEvent extends Event {

        public var data:Object;

        public function BaseEvent(type:String, params:Object=null){
            super(type);
            this.data = params;
        }
		
        override public function clone():Event{
            return (new BaseEvent(this.type, this.data));
        }
    }
}//package com.smartfoxserver.v2.core 
