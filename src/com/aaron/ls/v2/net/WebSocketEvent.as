package com.aaron.ls.v2.net
{
	import com.aaron.ls.v2.events.BaseEvent;
	
	public class WebSocketEvent extends BaseEvent
	{
		public static const CONNECT:String = "connect";				//链接成功
		public static const CLOSE:String = "close";					//关闭了链接
		public static const SOCKET_DATA:String = "cocketData";		//收到消息
		public static const CONNECT_FAIL:String = "connectFail";	//连接失败
		
		public function WebSocketEvent(type:String, params:Object=null)
		{
			super(type, params);
		}
	}
}