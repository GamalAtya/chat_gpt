


import 'package:chat_gpt/core/error/failures.dart';
import 'package:chat_gpt/features/chat/data/data_sources/chat_remote_data_source.dart';
import 'package:chat_gpt/features/chat/data/models/message_model.dart';

import 'package:chat_gpt/features/chat/domain/entities/chat.dart';

import 'package:chat_gpt/features/chat/domain/entities/message.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/reporsitories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final NetworkInfo networkInfo;
  final ChatRemoteDateSource remoteDateSource ;


  ChatRepositoryImpl({required this.networkInfo,required this.remoteDateSource});

  @override
  Future<Either<Failure, Chat>> sendMessage(List<Message> messages) async{
      if(await networkInfo.isConnected){
        try {
          final messagesList = List<MessageModel>.from(messages.map((e) => MessageModel.fromMessage(e)));
          final chat = await remoteDateSource.sendMessage(messagesList);
          return Right(chat);
        } on ServerException {
          return Left(ServerFailure());
        }
      }else{
         return Left(OfflineFailure());
      }
  }

}