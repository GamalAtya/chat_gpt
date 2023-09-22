import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_gpt/features/welcome_screen/domain/entities/welcome_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/use_cases/next_use_case.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final NextUseCase useCase;
  WelcomeBloc({required this.useCase}) : super(WelcomeInitial()) {
    on<WelcomeEvent>((event, emit) {
      if(event is WelcomeNext ){
        final entity = useCase.call(event.index);
        emit(WelcomeNextState(index: event.index +1, entity: entity));
      }
    });
  }
}
