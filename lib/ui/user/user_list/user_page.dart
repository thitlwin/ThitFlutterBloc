import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/user/user_list/index.dart';
import 'package:thit_flutter_bloc/ui/user/user_create/user_create_page.dart';

class UserPage extends StatefulWidget {
  static const String routeName = '/user';

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _userBloc = UserBloc(UnUserState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
        actions: [
          IconButton(
            tooltip: 'Add New',
            icon: const Icon(
              Icons.add,
            ),
            onPressed: () {
              print('add new user');
              Navigator.pushNamed(context, UserCreatePage.routeName);
            },
          ),
        ],
      ),
      body: UserScreen(userBloc: _userBloc),
    );
  }
}
