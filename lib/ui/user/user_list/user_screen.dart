import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/ui/user/user_list/index.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({
    Key key,
    @required UserBloc userBloc,
  })  : _userBloc = userBloc,
        super(key: key);

  final UserBloc _userBloc;

  @override
  UserScreenState createState() {
    return UserScreenState();
  }
}

class UserScreenState extends State<UserScreen> {
  UserScreenState();

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
    return BlocBuilder<UserBloc, UserState>(
        cubit: widget._userBloc,
        builder: (
          BuildContext context,
          UserState currentState,
        ) {
          if (currentState is UnUserState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorUserState) {
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
          if (currentState is InUserState) {
            if (currentState.userList?.length > 0) {
              return ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  for (int index = 0;
                      index < currentState.userList.length;
                      index++)
                    ListTile(
                      leading: ExcludeSemantics(
                        child: CircleAvatar(child: Text('$index')),
                      ),
                      title: Text("#${currentState.userList[index].name}"),
                      subtitle: Text('${currentState.userList[index].email}'),
                    ),
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("No user found."),
                  ],
                ),
              );
            }
          }
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
        });
  }

  void _load() {
    widget._userBloc.add(LoadUserEvent());
  }
}
