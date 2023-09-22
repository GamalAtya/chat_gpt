

import 'package:chat_gpt/features/welcome_screen/domain/entities/welcome_entity.dart';

abstract class WelcomeRepository {

  WelcomeEntity getWelcomeMessage(int index);
}