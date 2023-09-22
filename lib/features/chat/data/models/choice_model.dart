


import 'dart:convert';

import 'package:chat_gpt/features/chat/data/models/message_model.dart';
import 'package:chat_gpt/features/chat/domain/entities/choice.dart';

class ChoiceModel extends Choice {
  const ChoiceModel({required String finishReason, required int index, required MessageModel message}) :
        super(finishReason: finishReason, index: index, message: message);

  factory ChoiceModel.fromJson(Map<String , dynamic> json) => ChoiceModel(
      finishReason: json['finish_reason'],
      index: json['index'],
      message: MessageModel.fromJson(json['message']));

  factory ChoiceModel.fromChoice(Choice choice){
    if(choice is ChoiceModel){
      return choice;
    }
    return ChoiceModel(
        finishReason: choice.finishReason,
        index: choice.index,
        message:MessageModel.fromMessage(choice.message));
  }

  Map<String , dynamic> toJson()=> {
    'finish_reason' : finishReason ,
    'index' : index ,
    'message' : MessageModel.fromMessage(message).toJson()
  };
}