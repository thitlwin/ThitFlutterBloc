import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/bank/index.dart';

class BankPage extends StatefulWidget {
  static const String routeName = '/bank';

  @override
  _BankPageState createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  final _bankBloc = BankBloc(UnBankState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank'),
      ),
      body: BankScreen(bankBloc: _bankBloc),
    );
  }
}
