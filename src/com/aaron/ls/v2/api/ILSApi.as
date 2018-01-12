package com.aaron.ls.v2.api
{
	import com.aaron.ls.v2.entities.IRoom;
	import com.aaron.ls.v2.entities.data.LSObject;
	import com.aaron.ls.v2.setting.RoomSettings;

	public interface ILSApi
	{
		function login(userName:String, password:String,zoneName:String = "",params:LSObject = null):void;	
		function logout(zoneName:String = ""):void;	
		function joinRoom(id:*,pass:String = "",roomIdToLeave:int = -1,asSpect:Boolean = false):void;
		function leaveRoom(id:int = -1):void;
		function getRoomList(groupIds:Array = null):void;
		//function sendHandshakeRequest(isReconnection:Boolean=false):void;
		function createRoom(settings:RoomSettings, autoJoin:Boolean = false, roomToLeave:IRoom = null):void
			
			
		/**
		 * 發送公共方法
		 * @param message
		 * @param toRoomId
		 * 
		 */			
		function sentPublicMessage(message:String,toRoomId:int = -1):void;
		
		/**
		 * 發送私人消息
		 * @param message
		 * @param toUserId
		 * 
		 */		
		function sentPrivateMessage(message:String, toUserId:int):void;
	}
}