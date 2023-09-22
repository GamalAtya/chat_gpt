import 'package:chat_gpt/core/strings/app_strings.dart';
import 'package:chat_gpt/features/welcome_screen/domain/entities/welcome_entity.dart';

abstract class WelcomeLocalDataSource {
  WelcomeEntity getWelcomeEntity(int index);
}

class WelcomeLocalDataSourceImpl implements WelcomeLocalDataSource {
  List<WelcomeEntity> entities = [
    WelcomeEntity(
        icon: AppStrings.welcomeIcon1,
        title: 'Examples',
        messages: const [
          '“Explain quantum computing in simple terms”',
          '“Got any creative ideas for a 10 year old’s birthday?”',
          '“How do I make an HTTP request in Javascript?”'
        ]),
    WelcomeEntity(
        icon: AppStrings.welcomeIcon2,
        title: 'Capabilities',
        messages: const [
          'Remembers what user said earlier in the conversation',
          'Allows user to provide follow-up corrections',
          'Trained to decline inappropriate requests'
        ]),
    WelcomeEntity(
        icon: AppStrings.welcomeIcon3,
        title: 'Limitations',
        messages: const [
          'May occasionally generate incorrect information',
          'May occasionally produce harmful instructions or biased content',
          'Limited knowledge of world and events after 2021'
        ]),
  ];

  @override
  WelcomeEntity getWelcomeEntity(int index) {
    return entities[index];
  }
}
