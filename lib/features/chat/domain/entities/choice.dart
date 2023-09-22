

import 'package:equatable/equatable.dart';
import 'message.dart';

class Choice extends Equatable {
  final String finishReason ;
  final int index ;
  final Message message ;
  const Choice({required this.finishReason , required this.index , required this.message});

  @override
  List<Object?> get props => [finishReason , index , message];

}