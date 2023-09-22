
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../../core/error/exceptions.dart';
import '../models/chat_model.dart';
import 'package:http/http.dart' as http;

import '../models/message_model.dart';


abstract class ChatRemoteDateSource {
  Future<ChatModel> sendMessage(List<MessageModel> messages);
}


class ChatRemoteDataSourceImpl implements ChatRemoteDateSource {
  final http.Client client;
  ChatRemoteDataSourceImpl({required this.client});

  @override
  Future<ChatModel> sendMessage(List<MessageModel> messages) async{
    final response = await client.post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Content-Type' : 'application/json',
          'Authorization' : 'Bearer ${dotenv.env['token']}'
        },
      body: json.encode({
        "model": "gpt-3.5-turbo",
        "messages": messages.map((e) => e.toJson()).toList(),
        "temperature": 0.7
      })
    );
    if (response.statusCode == 200) {
      return ChatModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

}