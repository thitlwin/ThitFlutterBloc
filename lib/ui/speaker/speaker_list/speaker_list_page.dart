import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_create/speaker_create_page.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_list/index.dart';

class SpeakerListPage extends StatefulWidget {
  static const String routeName = '/speakerList';

  @override
  _SpeakerListPageState createState() => _SpeakerListPageState();
}

class _SpeakerListPageState extends State<SpeakerListPage> {
  final _speakerListBloc = SpeakerListBloc(UnSpeakerListState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpeakerList'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_box,
             ),
          onPressed: () {
            print('add New Speaker');
            Navigator.pushNamed(context, SpeakerCreatePage.routeName);
          },
         )
        ]
      ),
      body: SpeakerListScreen(speakerListBloc: _speakerListBloc),
    );
  }
}
