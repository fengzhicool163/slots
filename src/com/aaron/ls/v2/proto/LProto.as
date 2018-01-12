package com.aaron.ls.v2.proto
{

	import com.IProtobuf.Builder
	import laya.utils.Browser
	public class LProto
	{
		private var ProtoBuf:* = Browser.window.dcodeIO.ProtoBuf
		private var builder:*
		public function loadProtoFile(protoPath:String):void{
			builder = ProtoBuf.loadProtoFile(protoPath)
		}
		public function HeartBeatRequest_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["HeartBeatRequest"];
		};
		public function getHeartBeatRequest():HeartBeatRequest{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["HeartBeatRequest"];
			return new clazz();
		};
		public function HeartBeatResponse_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["HeartBeatResponse"];
		};
		public function getHeartBeatResponse():HeartBeatResponse{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["HeartBeatResponse"];
			return new clazz();
		};
		public function LoginRequest_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["LoginRequest"];
		};
		public function getLoginRequest():LoginRequest{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["LoginRequest"];
			return new clazz();
		};
		public function LoginResponse_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["LoginResponse"];
		};
		public function getLoginResponse():LoginResponse{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["LoginResponse"];
			return new clazz();
		};
		public function HandshakeRequest_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["HandshakeRequest"];
		};
		public function getHandshakeRequest():HandshakeRequest{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["HandshakeRequest"];
			return new clazz();
		};
		public function HandshakeResponse_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["HandshakeResponse"];
		};
		public function getHandshakeResponse():HandshakeResponse{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["HandshakeResponse"];
			return new clazz();
		};
		public function LogoutRequest_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["LogoutRequest"];
		};
		public function getLogoutRequest():LogoutRequest{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["LogoutRequest"];
			return new clazz();
		};
		public function LogoutResponse_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["LogoutResponse"];
		};
		public function getLogoutResponse():LogoutResponse{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["LogoutResponse"];
			return new clazz();
		};
		public function JoinRoomRequest_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["JoinRoomRequest"];
		};
		public function getJoinRoomRequest():JoinRoomRequest{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["JoinRoomRequest"];
			return new clazz();
		};
		public function JoinRoomResponese_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["JoinRoomResponese"];
		};
		public function getJoinRoomResponese():JoinRoomResponese{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["JoinRoomResponese"];
			return new clazz();
		};
		public function JoinRoomNotify_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["JoinRoomNotify"];
		};
		public function getJoinRoomNotify():JoinRoomNotify{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["JoinRoomNotify"];
			return new clazz();
		};
		public function LeaveRoomRequest_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["LeaveRoomRequest"];
		};
		public function getLeaveRoomRequest():LeaveRoomRequest{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["LeaveRoomRequest"];
			return new clazz();
		};
		public function LeaveRoomResponese_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["LeaveRoomResponese"];
		};
		public function getLeaveRoomResponese():LeaveRoomResponese{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["LeaveRoomResponese"];
			return new clazz();
		};
		public function LeaveRoomNotify_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["LeaveRoomNotify"];
		};
		public function getLeaveRoomNotify():LeaveRoomNotify{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["LeaveRoomNotify"];
			return new clazz();
		};
		public function ClientDisconnectionNotify_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["ClientDisconnectionNotify"];
		};
		public function getClientDisconnectionNotify():ClientDisconnectionNotify{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["ClientDisconnectionNotify"];
			return new clazz();
		};
		public function ClientDisconnectionReason_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["ClientDisconnectionReason"];
		};
		public function getClientDisconnectionReason():ClientDisconnectionReason{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["ClientDisconnectionReason"];
			return new clazz();
		};
		public function GenericMessageType_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["GenericMessageType"];
		};
		public function getGenericMessageType():GenericMessageType{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["GenericMessageType"];
			return new clazz();
		};
		public function GenericMessageRequest_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["GenericMessageRequest"];
		};
		public function getGenericMessageRequest():GenericMessageRequest{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["GenericMessageRequest"];
			return new clazz();
		};
		public function GenericMessageResponese_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["GenericMessageResponese"];
		};
		public function getGenericMessageResponese():GenericMessageResponese{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["GenericMessageResponese"];
			return new clazz();
		};
		public function GenericMessageNotify_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["GenericMessageNotify"];
		};
		public function getGenericMessageNotify():GenericMessageNotify{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["GenericMessageNotify"];
			return new clazz();
		};
		public function PublicMessage_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["PublicMessage"];
		};
		public function getPublicMessage():PublicMessage{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["PublicMessage"];
			return new clazz();
		};
		public function PrivateMessage_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["PrivateMessage"];
		};
		public function getPrivateMessage():PrivateMessage{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["PrivateMessage"];
			return new clazz();
		};
		public function GetRoomListRequest_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["GetRoomListRequest"];
		};
		public function getGetRoomListRequest():GetRoomListRequest{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["GetRoomListRequest"];
			return new clazz();
		};
		public function GetRoomListResponese_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["GetRoomListResponese"];
		};
		public function getGetRoomListResponese():GetRoomListResponese{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["GetRoomListResponese"];
			return new clazz();
		};
		public function User_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["User"];
		};
		public function getUser():User{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["User"];
			return new clazz();
		};
		public function Room_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["Room"];
		};
		public function getRoom():Room{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["Room"];
			return new clazz();
		};
		public function PRoomSetting_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["PRoomSetting"];
		};
		public function getPRoomSetting():PRoomSetting{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["PRoomSetting"];
			return new clazz();
		};
		public function PRoomPermissions_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["PRoomPermissions"];
		};
		public function getPRoomPermissions():PRoomPermissions{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["PRoomPermissions"];
			return new clazz();
		};
		public function PRoomExtension_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["PRoomExtension"];
		};
		public function getPRoomExtension():PRoomExtension{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["PRoomExtension"];
			return new clazz();
		};
		public function PRoomEvents_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["PRoomEvents"];
		};
		public function getPRoomEvents():PRoomEvents{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["PRoomEvents"];
			return new clazz();
		};
		public function SetRoomVariableRequest_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["SetRoomVariableRequest"];
		};
		public function getSetRoomVariableRequest():SetRoomVariableRequest{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["SetRoomVariableRequest"];
			return new clazz();
		};
		public function SetRoomVariableResponese_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["SetRoomVariableResponese"];
		};
		public function getSetRoomVariableResponese():SetRoomVariableResponese{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["SetRoomVariableResponese"];
			return new clazz();
		};
		public function SetRoomVariableNotify_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["SetRoomVariableNotify"];
		};
		public function getSetRoomVariableNotify():SetRoomVariableNotify{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["SetRoomVariableNotify"];
			return new clazz();
		};
		public function SetUserVariableRequest_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["SetUserVariableRequest"];
		};
		public function getSetUserVariableRequest():SetUserVariableRequest{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["SetUserVariableRequest"];
			return new clazz();
		};
		public function SetUserVariableResponese_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["SetUserVariableResponese"];
		};
		public function getSetUserVariableResponese():SetUserVariableResponese{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["SetUserVariableResponese"];
			return new clazz();
		};
		public function SetUserVariableNotify_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["SetUserVariableNotify"];
		};
		public function getSetUserVariableNotify():SetUserVariableNotify{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["SetUserVariableNotify"];
			return new clazz();
		};
		public function PVariables_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["PVariables"];
		};
		public function getPVariables():PVariables{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["PVariables"];
			return new clazz();
		};
		public function PVariable_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["PVariable"];
		};
		public function getPVariable():PVariable{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["PVariable"];
			return new clazz();
		};
		public function PObjectType_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["PObjectType"];
		};
		public function getPObjectType():PObjectType{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["PObjectType"];
			return new clazz();
		};
		public function PObjectItem_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["PObjectItem"];
		};
		public function getPObjectItem():PObjectItem{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["PObjectItem"];
			return new clazz();
		};
		public function PObject_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["PObject"];
		};
		public function getPObject():PObject{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["PObject"];
			return new clazz();
		};
		public function CreateRoomRequest_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["CreateRoomRequest"];
		};
		public function getCreateRoomRequest():CreateRoomRequest{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["CreateRoomRequest"];
			return new clazz();
		};
		public function CreateRoomResponese_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["CreateRoomResponese"];
		};
		public function getCreateRoomResponese():CreateRoomResponese{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["CreateRoomResponese"];
			return new clazz();
		};
		public function RoomAdded_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["RoomAdded"];
		};
		public function getRoomAdded():RoomAdded{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["RoomAdded"];
			return new clazz();
		};
		public function ErrorCode_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["ErrorCode"];
		};
		public function getErrorCode():ErrorCode{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["ErrorCode"];
			return new clazz();
		};
		public function MessageID_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["MessageID"];
		};
		public function getMessageID():MessageID{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["MessageID"];
			return new clazz();
		};
		public function MSG_Builer():Builder{
			return builder.build("com.aaron.ls.v2.proto")["MSG"];
		};
		public function getMSG():MSG{
			var clazz:* = builder.build("com.aaron.ls.v2.proto")["MSG"];
			return new clazz();
		};
	}
}
