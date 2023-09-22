part of 'welcome_bloc.dart';

abstract class WelcomeState extends Equatable {
  const WelcomeState();
}

class WelcomeInitial extends WelcomeState {
  @override
  List<Object> get props => [];
}

class WelcomeNextState extends WelcomeState {
  final int index ;
  final WelcomeEntity entity ;
  const WelcomeNextState({required this.index,required this.entity});
  @override
  List<Object> get props => [index , entity];
}
