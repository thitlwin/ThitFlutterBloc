import 'dart:async';
import 'dart:developer' as developer;

import 'package:thit_flutter_bloc/data/model/user.dart';
import 'package:thit_flutter_bloc/repository/user_repository.dart';
import 'package:thit_flutter_bloc/ui/user/user_list/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserEvent {
  final _userRepository = UserRepository();
  Stream<UserState> applyAsync({UserState currentState, UserBloc bloc});
}

class UnUserEvent extends UserEvent {
  @override
  Stream<UserState> applyAsync({UserState currentState, UserBloc bloc}) async* {
    yield UnUserState();
  }
}

class LoadUserEvent extends UserEvent {
  @override
  Stream<UserState> applyAsync({UserState currentState, UserBloc bloc}) async* {
    try {
      yield UnUserState();
      List<User> userList = await _userRepository.loadUser();
      yield InUserState(userList: userList);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadUserEvent', error: _, stackTrace: stackTrace);
      yield ErrorUserState(_?.toString());
    }
  }
}
