import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/message.dart';
import '../../domain/use_cases/send_message_useCase.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessageUseCase sendMessageUseCase ;

  ChatBloc({required this.sendMessageUseCase}) : super(EmptyChatState()) {
    on<ChatEvent>((event, emit) async{
      if(event is SendChatEvent){
        final chat = sendMessageUseCase(event.messages);
      }
    });
  }
}
