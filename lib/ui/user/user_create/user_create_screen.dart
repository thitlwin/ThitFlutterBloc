import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/data/model/user.dart';
import 'package:thit_flutter_bloc/ui/user/user_create/index.dart';

class UserCreateScreen extends StatefulWidget {
  const UserCreateScreen({
    Key key,
    @required UserCreateBloc userCreateBloc,
  })  : _userCreateBloc = userCreateBloc,
        super(key: key);

  final UserCreateBloc _userCreateBloc;

  @override
  UserCreateScreenState createState() {
    return UserCreateScreenState();
  }
}

class UserCreateScreenState extends State<UserCreateScreen> {
  UserCreateScreenState();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    return BlocConsumer<UserCreateBloc, UserCreateState>(
        cubit: widget._userCreateBloc,
        listener: (context, state) {
          if (state is SuccessUserCreateState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('Successfully created'),
              duration: const Duration(seconds: 1),
            ));
          }
        },
        builder: (
          BuildContext context,
          UserCreateState currentState,
        ) {
          if (currentState is UnUserCreateState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorUserCreateState) {
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
          if (currentState is InUserCreateState) {
            return _formContent();
          }
          if (currentState is SuccessUserCreateState) {
            nameController.text = "";
            emailController.text = "";
            return _formContent();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load() {
    widget._userCreateBloc.add(LoadUserCreateEvent());
  }

  Widget _formContent() {
    const sizedBoxSpace = SizedBox(height: 24);
    return Form(
      key: _formKey,
      child: Scrollbar(
        child: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.down,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              sizedBoxSpace,
              TextFormField(
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  filled: true,
                  icon: const Icon(Icons.person),
                  hintText: 'Name',
                  labelText: 'Name',
                ),
                onSaved: (value) {},
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              sizedBoxSpace,
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  icon: const Icon(Icons.email),
                  hintText: 'Email',
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {},
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
              sizedBoxSpace,
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    var user = User(
                        name: nameController.text, email: emailController.text);
                    widget._userCreateBloc.add(DoUserCreateEvent(user: user));
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
