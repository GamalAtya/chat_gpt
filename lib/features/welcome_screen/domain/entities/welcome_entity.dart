


import 'package:equatable/equatable.dart';

class WelcomeEntity extends Equatable {
  final String icon ;
  final String title;
  final List<String> messages ;

 const WelcomeEntity({required this.icon,required this.title, required this.messages});

  @override
  List<Object?> get props => [icon , title , messages];

}