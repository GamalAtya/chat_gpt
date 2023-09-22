part of 'welcome_bloc.dart';

abstract class WelcomeEvent extends Equatable {
  const WelcomeEvent();
}

class WelcomeNext extends WelcomeEvent {
  final int index ;
  const WelcomeNext({required this.index});
  @override
  List<Object?> get props => [index];

}
