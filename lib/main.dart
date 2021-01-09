import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/bank/index.dart';
import 'package:thit_flutter_bloc/ui/user/user_create/index.dart';

import 'ui/user/user_list/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CURD Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
      routes: {
        UserPage.routeName: (context) => UserPage(),
        UserCreatePage.routeName: (context) => UserCreatePage(),
        BankPage.routeName: (context) => BankPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, UserPage.routeName);
              },
              child: Text('Open User (Sqlite sample)'),
              color: Colors.amber,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, BankPage.routeName);
              },
              child: Text('Open Bank (Api sample)'),
              color: Colors.amber,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
