


import 'package:chat_gpt/features/welcome_screen/data/data_sources/welcome_local_data_source.dart';
import 'package:chat_gpt/features/welcome_screen/domain/entities/welcome_entity.dart';
import 'package:chat_gpt/features/welcome_screen/domain/repositories/welcome_repository.dart';

class WelcomeRepositoryImpl implements WelcomeRepository {
  final WelcomeLocalDataSource welcomeLocalDataSource ;


  WelcomeRepositoryImpl({required this.welcomeLocalDataSource});

  @override
  WelcomeEntity getWelcomeMessage(int index) {
    return welcomeLocalDataSource.getWelcomeEntity(index);
  }

}