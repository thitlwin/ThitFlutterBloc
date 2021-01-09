import 'package:equatable/equatable.dart';
import 'package:thit_flutter_bloc/data/model/user.dart';

abstract class UserState extends Equatable {
  final List propss;
  UserState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnUserState extends UserState {
  UnUserState();

  @override
  String toString() => 'UnUserState';
}

/// Initialized
class InUserState extends UserState {
  final List<User> userList;

  InUserState({this.userList}) : super([userList]);

  @override
  String toString() => 'InUserState $userList';
}

class ErrorUserState extends UserState {
  final String errorMessage;

  ErrorUserState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorUserState';
}
