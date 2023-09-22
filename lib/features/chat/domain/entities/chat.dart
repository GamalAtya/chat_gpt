

import 'package:chat_gpt/features/chat/domain/entities/usage.dart';
import 'package:equatable/equatable.dart';
import 'choice.dart';

class Chat extends Equatable {

  final String id ;
  final int created ;
  final String model;
  final String object;
  final Usage usage ;
  final List<Choice> choices ;


  const Chat(
      {
      required  this.id,
        required this.created,
        required this.model,
        required this.object,
        required this.usage,
        required this.choices
      });

  @override
  List<Object?> get props => [id , created , model , object , usage , choices];

}