part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent extends Equatable{
  const ChatEvent();
  @override
  List<Object> get props => [];
}


class SendChatEvent extends ChatEvent {
  final List<Message> messages;

  const SendChatEvent({required this.messages});
  @override
  List<Object> get props => [messages];
}
