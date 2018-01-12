package com.aaron.ls.v2.controllers
{
	import com.aaron.ls.v2.LightClinet;
	import com.aaron.ls.v2.bitswarm.BitSwarmClient;
	import com.aaron.ls.v2.bitswarm.LSMessage;
	import com.aaron.ls.v2.events.LSEvent;

	public class ExtensionController
	{
		private var _client:BitSwarmClient;
		private var _ls:LightClinet;
		
		public function ExtensionController(client:BitSwarmClient, ls:LightClinet)
		{
			_client = client;
			_ls = ls;
			
			_client.on(LSEvent.EXTENSION_RESPONSE,this,exHandler);
		}
		
		private function exHandler(msg:LSMessage):void{
			_ls.event(msg.msgId.toString(),msg);
			_ls.event(LSEvent.EXTENSION_RESPONSE,msg);
		}
	}
}