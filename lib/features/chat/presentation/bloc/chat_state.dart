part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class EmptyChatState extends ChatState {}
class LoadingChatState extends ChatState {}


