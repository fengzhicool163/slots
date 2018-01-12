//Created by Action Script Viewer - http://www.buraks.com/asv
package com.aaron.ls.v2.events
{
	import com.iflash.events.Event;

    public class LSEvent extends BaseEvent {
		
		
		//socket
		public static const CONNECTION:String = "connection";////////////链接成功
		public static const CONNECT_FAIL:String = "connectionLost";////////连接的时候触发失败
		public static const CONNECTION_RETRY:String = "connectionRetry";/////开始重连触发的事件  一般客户端接受到这消息 要提示用户正在重连中
		public static const CONNECTION_RESUME:String = "connectionResume";/////重连成功
		public static const DISCONNECT:String = "disConnect";///////////////////经过重连后任然重连不上
		public static const CLOSE:String = "close";/////////////////////////////连接被关闭
		public static const RECEIVE:String = "receive";////////////////////////收到数据

		public static const NET_SPEED_UPDATA:String = "netSpeedUpdata";///////////////网速数据更新
		
        public static const HANDSHAKE:String = "handshake";
        public static const UDP_INIT:String = "udpInit";
       
        public static const PING_PONG:String = "pingPong";
        public static const SOCKET_ERROR:String = "socketError";
		
		
		public static const ROOM_VARIABLES_UPDATE:String = "roomVariablesUpdate";
		public static const SET_ROOM_VARIABLES_ERROR:String = "setRoomVariablesError";
		public static const USER_VARIABLES_UPDATE:String = "userVariablesUpdate";
		public static const SET_USER_VARIABLES_ERROR:String = "setUserVariablesError";
        
        
        
        public static const CONNECTION_ATTEMPT_HTTP:String = "connectionAttemptHttp";
        public static const CONFIG_LOAD_SUCCESS:String = "configLoadSuccess";
        public static const CONFIG_LOAD_FAILURE:String = "configLoadFailure";
        public static const LOGIN:String = "login";
        public static const LOGIN_ERROR:String = "loginError";
        public static const LOGOUT:String = "logout";
        public static const ROOM_ADD:String = "roomAdd";
        public static const ROOM_REMOVE:String = "roomRemove";
        public static const ROOM_CREATION_ERROR:String = "roomCreationError";
        public static const ROOM_JOIN:String = "roomJoin";
        public static const ROOM_JOIN_ERROR:String = "roomJoinError";
        public static const USER_ENTER_ROOM:String = "userEnterRoom";
        public static const USER_EXIT_ROOM:String = "userExitRoom";
		public static const USER_LEAVE_ROOM_ERROR:String = "userLeaveRoomError";
        public static const USER_COUNT_CHANGE:String = "userCountChange";
        public static const PUBLIC_MESSAGE:String = "publicMessage";
        public static const PRIVATE_MESSAGE:String = "privateMessage";
        public static const OBJECT_MESSAGE:String = "objectMessage";
        public static const MODERATOR_MESSAGE:String = "moderatorMessage";
        public static const ADMIN_MESSAGE:String = "adminMessage";
        public static const EXTENSION_RESPONSE:String = "extensionResponse";
        
        public static const ROOM_GROUP_SUBSCRIBE:String = "roomGroupSubscribe";
        public static const ROOM_GROUP_SUBSCRIBE_ERROR:String = "roomGroupSubscribeError";
        public static const ROOM_GROUP_UNSUBSCRIBE:String = "roomGroupUnsubscribe";
        public static const ROOM_GROUP_UNSUBSCRIBE_ERROR:String = "roomGroupUnsubscribeError";
        public static const PLAYER_TO_SPECTATOR:String = "playerToSpectator";
        public static const PLAYER_TO_SPECTATOR_ERROR:String = "playerToSpectatorError";
        public static const SPECTATOR_TO_PLAYER:String = "spectatorToPlayer";
        public static const SPECTATOR_TO_PLAYER_ERROR:String = "spectatorToPlayerError";
        public static const ROOM_NAME_CHANGE:String = "roomNameChange";
        public static const ROOM_NAME_CHANGE_ERROR:String = "roomNameChangeError";
        public static const ROOM_PASSWORD_STATE_CHANGE:String = "roomPasswordStateChange";
        public static const ROOM_PASSWORD_STATE_CHANGE_ERROR:String = "roomPasswordStateChangeError";
        public static const ROOM_CAPACITY_CHANGE:String = "roomCapacityChange";
        public static const ROOM_CAPACITY_CHANGE_ERROR:String = "roomCapacityChangeError";
        public static const ROOM_FIND_RESULT:String = "roomFindResult";
        public static const USER_FIND_RESULT:String = "userFindResult";
        public static const INVITATION:String = "invitation";
        public static const INVITATION_REPLY:String = "invitationReply";
        public static const INVITATION_REPLY_ERROR:String = "invitationReplyError";
        public static const PROXIMITY_LIST_UPDATE:String = "proximityListUpdate";
        public static const MMOITEM_VARIABLES_UPDATE:String = "mmoItemVariablesUpdate";
        public static const CRYPTO_INIT:String = "cryptoInit";
		
		public static const GET_ROOM_LIST:String = "getRoomList";

        public function LSEvent(type:String, params:Object = null){
            super(type,params);
        }
        override public function clone():Event{
            return (new LSEvent(this.type, this.data));
        }
      

    }
}//package com.smartfoxserver.v2.core 
