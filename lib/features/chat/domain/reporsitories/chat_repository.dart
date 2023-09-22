import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/chat.dart';
import '../entities/message.dart';

abstract class ChatRepository {
  Future<Either<Failure , Chat>> sendMessage(List<Message> messages) ;
}