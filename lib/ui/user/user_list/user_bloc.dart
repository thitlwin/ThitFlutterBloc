import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:thit_flutter_bloc/ui/user/user_list/index.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserState initialState) : super(initialState);

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'UserBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
