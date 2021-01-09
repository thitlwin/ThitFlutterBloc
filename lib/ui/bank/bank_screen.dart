import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/data/model/bank.dart';
import 'package:thit_flutter_bloc/ui/bank/index.dart';

class BankScreen extends StatefulWidget {
  const BankScreen({
    Key key,
    @required BankBloc bankBloc,
  })  : _bankBloc = bankBloc,
        super(key: key);

  final BankBloc _bankBloc;

  @override
  BankScreenState createState() {
    return BankScreenState();
  }
}

class BankScreenState extends State<BankScreen> {
  BankScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankBloc, BankState>(
        cubit: widget._bankBloc,
        builder: (
          BuildContext context,
          BankState currentState,
        ) {
          if (currentState is UnBankState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorBankState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: _load,
                  ),
                ),
              ],
            ));
          }
          if (currentState is InBankState) {
            if (currentState.bankList?.length > 0) {
              return ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  for (int index = 0;
                      index < currentState.bankList.length;
                      index++)
                    ListTile(
                      leading: ExcludeSemantics(
                        child: CircleAvatar(child: Text('$index')),
                      ),
                      title: Text("#${index + 1}"),
                      subtitle: Text('${currentState.bankList[index].name}'),
                    ),
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("No bank list found."),
                  ],
                ),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load() {
    widget._bankBloc.add(LoadBankEvent());
  }
}
