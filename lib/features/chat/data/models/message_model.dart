

import 'package:chat_gpt/features/chat/domain/entities/message.dart';

class MessageModel extends Message {
  const MessageModel({required String role, required String content}): super(role: role , content: content);

  factory MessageModel.fromJson(Map<String , dynamic> json) => MessageModel(
      role: json['role'],
      content: json['content']);

  factory MessageModel.fromMessage(Message message) {
    if (message is MessageModel) {
      return message;
    }
    return MessageModel(
       role: message.role,
       content: message.content
    );
  }

  Map<String , dynamic> toJson() => {
    "role" : role ,
    "content" : content
  };

}