import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/user/user_create/index.dart';

class UserCreatePage extends StatefulWidget {
  static const String routeName = '/userCreate';

  @override
  _UserCreatePageState createState() => _UserCreatePageState();
}

class _UserCreatePageState extends State<UserCreatePage> {
  final _userCreateBloc = UserCreateBloc(UnUserCreateState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
      ),
      body: UserCreateScreen(userCreateBloc: _userCreateBloc),
    );
  }
}
