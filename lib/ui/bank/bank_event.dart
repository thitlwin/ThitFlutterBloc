import 'dart:async';
import 'dart:developer' as developer;

import 'package:thit_flutter_bloc/repository/bank_repository.dart';
import 'package:thit_flutter_bloc/ui/bank/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BankEvent {
  final BankRepository _bankRepository = new BankRepository();
  Stream<BankState> applyAsync({BankState currentState, BankBloc bloc});
}

class UnBankEvent extends BankEvent {
  @override
  Stream<BankState> applyAsync({BankState currentState, BankBloc bloc}) async* {
    yield UnBankState();
  }
}

class LoadBankEvent extends BankEvent {
  @override
  Stream<BankState> applyAsync({BankState currentState, BankBloc bloc}) async* {
    try {
      yield UnBankState();
      // await Future.delayed(Duration(seconds: 1));
      var res = await _bankRepository.getBankListFromApi();
      print(res);
      yield InBankState(res);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadBankEvent', error: _, stackTrace: stackTrace);
      yield ErrorBankState(_?.toString());
    }
  }
}
