

import 'package:equatable/equatable.dart';

class Usage extends Equatable {
  final int completionTokens ;
  final int promptTokens ;
  final int totalTokens ;

  const Usage({required this.completionTokens , required this.promptTokens, required this.totalTokens});

  @override
  List<Object?> get props => [totalTokens , completionTokens , promptTokens];

}