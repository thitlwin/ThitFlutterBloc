import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/audio/audio_create/index.dart';
import 'package:thit_flutter_bloc/ui/audio/audio_list/index.dart';
import 'package:thit_flutter_bloc/ui/bank/index.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_create/genre_create_page.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_list/genre_page.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_create/index.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_list/index.dart';
import 'package:thit_flutter_bloc/ui/user/user_create/index.dart';
import 'package:thit_flutter_bloc/utils/light_theme.dart';

import 'ui/user/user_list/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CURD Demo',
      theme: myTheme,
      home: MyHomePage(title: 'Home Page'),
      routes: {
        AudioListPage.routeName: (context) => AudioListPage(),
        AudioCreatePage.routeName: (context) => AudioCreatePage(),
        GenreListPage.routeName: (context) => GenreListPage(),
        GenreCreatePage.routeName: (context) => GenreCreatePage(),
        UserPage.routeName: (context) => UserPage(),
        UserCreatePage.routeName: (context) => UserCreatePage(),
        BankPage.routeName: (context) => BankPage(),
        SpeakerListPage.routeName: (context) => SpeakerListPage(),
        SpeakerCreatePage.routeName: (context) => SpeakerCreatePage(),
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
                Navigator.pushNamed(context, AudioListPage.routeName);
              },
              child: Text('Audio List'),
              color: Colors.blueGrey,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, GenreListPage.routeName);
              },
              child: Text('Genre List'),
              color: Colors.blueGrey,
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
                Navigator.pushNamed(context, SpeakerListPage.routeName);
              },
              child: Text('Speaker'),
              color: Colors.amberAccent,
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
