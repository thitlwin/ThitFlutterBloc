import 'package:equatable/equatable.dart';

abstract class UserCreateState extends Equatable {
  final List propss;
  UserCreateState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnUserCreateState extends UserCreateState {
  UnUserCreateState();

  @override
  String toString() => 'UnUserCreateState';
}

/// Initialized
class InUserCreateState extends UserCreateState {
  final String hello;

  InUserCreateState(this.hello) : super([hello]);

  @override
  String toString() => 'InUserCreateState $hello';
}

class ErrorUserCreateState extends UserCreateState {
  final String errorMessage;

  ErrorUserCreateState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorUserCreateState';
}

class SuccessUserCreateState extends UserCreateState {
  SuccessUserCreateState();

  @override
  String toString() => 'SuccessUserCreateState';
}
