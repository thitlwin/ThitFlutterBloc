import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:thit_flutter_bloc/ui/user/user_create/index.dart';

class UserCreateBloc extends Bloc<UserCreateEvent, UserCreateState> {
  UserCreateBloc(UserCreateState initialState) : super(initialState);

  @override
  Stream<UserCreateState> mapEventToState(
    UserCreateEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'UserCreateBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
