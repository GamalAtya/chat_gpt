
import 'package:chat_gpt/features/chat/data/models/usage_model.dart';
import '../../domain/entities/chat.dart';
import 'choice_model.dart';

class ChatModel extends Chat {
  const ChatModel({required String id,
    required int created,
    required String model,
    required String object,
    required UsageModel usage,
    required List<ChoiceModel> choices
  }) : super(id: id,
      created: created, model: model,
      object: object, usage: usage, choices: choices);

  Map<String , dynamic> toJson () => {
    "id" : id ,
    "model" : model,
    "object" : object,
    "usage" : UsageModel.fromUsage(usage).toJson(),
    "choices" : choices.map((e) => ChoiceModel.fromChoice(e).toJson()).toList()
  };

  factory ChatModel.fromJson(Map<String , dynamic> json) => ChatModel(
      id: json['id'],
      created: json['created'],
      model: json['model'],
      object: json['object'],
      usage: UsageModel.fromJson(json['usage']) ,
      choices:List<ChoiceModel>.from(json['choices'].map((e) => ChoiceModel.fromJson(e))) ) ;
}