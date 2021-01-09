import 'dart:async';
import 'dart:developer' as developer;

import 'package:thit_flutter_bloc/data/model/user.dart';
import 'package:thit_flutter_bloc/repository/user_repository.dart';
import 'package:thit_flutter_bloc/ui/user/user_create/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserCreateEvent {
  final _userRepository = UserRepository();
  Stream<UserCreateState> applyAsync(
      {UserCreateState currentState, UserCreateBloc bloc});
}

class UnUserCreateEvent extends UserCreateEvent {
  @override
  Stream<UserCreateState> applyAsync(
      {UserCreateState currentState, UserCreateBloc bloc}) async* {
    yield UnUserCreateState();
  }
}

class LoadUserCreateEvent extends UserCreateEvent {
  @override
  Stream<UserCreateState> applyAsync(
      {UserCreateState currentState, UserCreateBloc bloc}) async* {
    try {
      yield UnUserCreateState();
      await Future.delayed(Duration(seconds: 1));
      yield InUserCreateState('Hello world');
      print('LoadUserCreateEvent-----');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadUserCreateEvent', error: _, stackTrace: stackTrace);
      yield ErrorUserCreateState(_?.toString());
    }
  }
}

class DoUserCreateEvent extends UserCreateEvent {
  final User user;
  DoUserCreateEvent({this.user});

  @override
  List<Object> get props => [user];

  @override
  Stream<UserCreateState> applyAsync(
      {UserCreateState currentState, UserCreateBloc bloc}) async* {
    try {
      yield UnUserCreateState();
      var res = await _userRepository.saveUser(user);
      print(res);
      if (res > 0) {
        yield SuccessUserCreateState();
      } else
        yield ErrorUserCreateState("Fail to create user.");
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'DoUserCreateEvent', error: _, stackTrace: stackTrace);
      yield ErrorUserCreateState(_?.toString());
    }
  }
}
