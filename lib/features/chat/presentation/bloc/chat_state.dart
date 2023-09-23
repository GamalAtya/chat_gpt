part of 'chat_bloc.dart';

@immutable
abstract class ChatState extends Equatable{
  const ChatState();
}

class ChatInitial extends ChatState {
  @override
  List<Object?> get props => [];

}
class EmptyChatState extends ChatState {
  @override
  List<Object?> get props => [];
}
class LoadingChatState extends ChatState {
  final List<Message> messages  ;
  const LoadingChatState({required this.messages});
  @override
  List<Object?> get props => [messages];
}

class RepliedChatState extends ChatState {
  final List<Chat> chat  ;
  const RepliedChatState({required this.chat});
  @override
  List<Object?> get props => [chat];
}


