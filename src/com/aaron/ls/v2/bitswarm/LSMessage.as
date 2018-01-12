package com.aaron.ls.v2.bitswarm
{
	import com.IProtobuf.Message;
	import com.IProtobuf.MessageBuilder;
	import com.aaron.ls.v2.proto.LProto;
	import com.aaron.ls.v2.proto.MSG;
	
	import laya.utils.Byte;

	public class LSMessage
	{
		private var _content:MSG;
		private var _extendMsg:Message;
		private var _adminMsg:Message;
		
		public function LSMessage()
		{
		}
		
		public static function creatMessage(msgbyte:Byte,msgBuilder:MessageBuilder,exMsgBuilder:MessageBuilder):LSMessage{
			var message:LSMessage = new LSMessage();
			message.decode(msgbyte,msgBuilder,exMsgBuilder);
			return message;
		}
		
		public function decode(msgbyte:Byte,msgBuilder:MessageBuilder,exMsgBuilder:MessageBuilder):void{
			_content = msgBuilder.decode(msgbyte.buffer) as MSG;
			if(_content.extendMsg){
				_extendMsg = exMsgBuilder.decode(_content.extendMsg.toBuffer());
			}
		}
		
		public function get msgId():int{
			return _content.msgid;
		}
		
		public function get error():int{
			return _content.error;
		}
		
		public function get content():MSG{
			return _content;
		}
		
		public function get extendMsg():Message{
			return _extendMsg;
		}
		
		public function get adminMsg():Message{
			return _adminMsg;
		}
	}
}