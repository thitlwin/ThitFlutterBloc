import 'package:thit_flutter_bloc/data/model/bank.dart';
import 'package:thit_flutter_bloc/provider/bank_provider.dart';

class BankRepository {
  final BankProvider _bankProvider = BankProvider();

  BankRepository();

  Future addBank(Bank bank) {
    return _bankProvider.saveBank(bank);
  }

  Future getBankListFromDb() {
    return _bankProvider.loadBankListFromDB();
  }

  Future getBankListFromApi() {
    return _bankProvider.loadBankListFromApi();
  }

  Future deleteBank(int id) {
    return _bankProvider.deleteBank(id);
  }
}
