import 'package:equatable/equatable.dart';
import 'package:thit_flutter_bloc/data/model/bank.dart';

abstract class BankState extends Equatable {
  final List propss;
  BankState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnBankState extends BankState {
  UnBankState();

  @override
  String toString() => 'UnBankState';
}

/// Initialized
class InBankState extends BankState {
  final List<Bank> bankList;

  InBankState(this.bankList) : super([bankList]);

  @override
  String toString() => 'InBankState $bankList';
}

class ErrorBankState extends BankState {
  final String errorMessage;

  ErrorBankState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorBankState';
}
