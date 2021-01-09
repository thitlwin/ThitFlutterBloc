import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:thit_flutter_bloc/ui/bank/index.dart';

class BankBloc extends Bloc<BankEvent, BankState> {

  BankBloc(BankState initialState) : super(initialState);

  @override
  Stream<BankState> mapEventToState(
    BankEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'BankBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
