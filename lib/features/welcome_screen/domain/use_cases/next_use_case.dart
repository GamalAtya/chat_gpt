


import 'package:chat_gpt/features/welcome_screen/domain/entities/welcome_entity.dart';
import 'package:chat_gpt/features/welcome_screen/domain/repositories/welcome_repository.dart';


class NextUseCase {
  final WelcomeRepository welcomeRepository ;
  NextUseCase({required this.welcomeRepository});

  WelcomeEntity call(int index){
    return welcomeRepository.getWelcomeMessage(index);
  }
}