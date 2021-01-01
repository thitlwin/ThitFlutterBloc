import 'dart:async';
import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:thit_flutter_bloc/data/api/api_provider.dart';
import 'package:thit_flutter_bloc/data/db/database_provider.dart';
import 'package:thit_flutter_bloc/data/db/table_provider.dart';
import 'package:thit_flutter_bloc/data/model/bank.dart';
import 'package:thit_flutter_bloc/utils/constants.dart';
import 'package:thit_flutter_bloc/utils/logging_interceptors.dart';

class BankProvider {
  final dbProvider = DatabaseProvider.dbProvider;

  ApiProvider _apiProvider;
  BankProvider() {
    Dio _dio = Dio(ApiConstant.options);
    _dio.interceptors.add(LoggingInterceptors());
    _apiProvider = ApiProvider(_dio);
  }

  Future<List> loadBankListFromApi() async {
    print('----------getBankList@BankProvider');
    try {
      return _apiProvider.getBanks().then((it) {
        return it.banks;
      }).catchError((Object object) {
        developer.log(object.toString());
      });
    } catch (e) {
      developer.log("Error");
    }
  }

  Future<List> loadBankListFromDB() async {
    print('----------loadBankListFromDB@BankProvider');
    final db = await dbProvider.database;
    var bankList = List<Bank>();
    List<Map> result = await db.query(TableProvider.bankTable);
    bankList = result.map((it) => Bank.fromJson(it)).toList();
    print('----------bankList@BankProvider, bankList=' + bankList.toString());
    return bankList;
  }

  Future<int> saveBank(Bank bank) async {
    try {
      final db = await dbProvider.database;
      var result = await db.insert(TableProvider.bankTable, bank.toJson());
      return result;
    } catch (e, stackTrace) {
      developer.log("Saved Error", error: e, stackTrace: stackTrace);
    }
  }

  Future<int> deleteBank(int id) async {
    print('delete bank at db -----');
    try {
      final db = await dbProvider.database;
      var result = await db
          .delete(TableProvider.bankTable, where: 'id = ?', whereArgs: [id]);
      return result;
    } catch (e, stackTrace) {
      developer.log("Error",
          name: 'deleteBank', error: e, stackTrace: stackTrace);
    }
  }
}
