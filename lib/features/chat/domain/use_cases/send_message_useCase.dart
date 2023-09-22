
import 'package:chat_gpt/core/error/failures.dart';
import 'package:chat_gpt/features/chat/domain/entities/chat.dart';
import 'package:chat_gpt/features/chat/domain/reporsitories/chat_repository.dart';
import 'package:dartz/dartz.dart';
import '../entities/message.dart';

class SendMessageUseCase {
  final ChatRepository chatRepository;

  SendMessageUseCase({required this.chatRepository});

  Future<Either<Failure , Chat>> call(List<Message> messages) async{
  return await chatRepository.sendMessage(messages);
}
}