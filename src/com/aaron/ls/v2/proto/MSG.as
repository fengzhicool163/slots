package com.aaron.ls.v2.proto
{
	import com.IProtobuf.ByteBuffer;
	import com.IProtobuf.Message;

	public class MSG extends Message
	{

		public var msgid:int = 1;
		public var error:int = 2;
		public var heartBeatRequest:HeartBeatRequest = null;
		public var heartBeatResponse:HeartBeatResponse = null;
		public var loginRequest:LoginRequest = null;
		public var loginResponse:LoginResponse = null;
		public var handshakeRequest:HandshakeRequest = null;
		public var handshakeResponse:HandshakeResponse = null;
		public var joinRoomRequest:JoinRoomRequest = null;
		public var joinRoomResponese:JoinRoomResponese = null;
		public var joinRoomNotify:JoinRoomNotify = null;
		public var leaveRoomRequest:LeaveRoomRequest = null;
		public var leaveRoomResponese:LeaveRoomResponese = null;
		public var leaveRoomNotify:LeaveRoomNotify = null;
		public var getRoomListRequest:GetRoomListRequest = null;
		public var getRoomListResponese:GetRoomListResponese = null;
		public var logoutRequest:LogoutRequest = null;
		public var logoutResponse:LogoutResponse = null;
		public var setRoomVariableRequest:SetRoomVariableRequest = null;
		public var setRoomVariableResponese:SetRoomVariableResponese = null;
		public var setRoomVariableNotify:SetRoomVariableNotify = null;
		public var setUserVariableRequest:SetUserVariableRequest = null;
		public var setUserVariableResponese:SetUserVariableResponese = null;
		public var setUserVariableNotify:SetUserVariableNotify = null;
		public var genericMessageRequest:GenericMessageRequest = null;
		public var genericMessageResponese:GenericMessageResponese = null;
		public var genericMessageNotify:GenericMessageNotify = null;
		public var clientDisconnectionNotify:ClientDisconnectionNotify = null;
		public var createRoomRequest:CreateRoomRequest = null;
		public var createRoomResponese:CreateRoomResponese = null;
		public var roomAdded:RoomAdded = null;
		public var extendMsg:ByteBuffer = null;
		public var adminMsg:ByteBuffer = null;
		public function writeTo(value:*):void{
		}
	}
}
