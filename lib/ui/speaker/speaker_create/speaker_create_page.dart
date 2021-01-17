import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_create/index.dart';

class SpeakerCreatePage extends StatefulWidget {
  static const String routeName = '/speakerCreate';

  @override
  _SpeakerCreatePageState createState() => _SpeakerCreatePageState();
}

class _SpeakerCreatePageState extends State<SpeakerCreatePage> {
  final _speakerCreateBloc = SpeakerCreateBloc(UnSpeakerCreateState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpeakerCreate'),
      ),
      body: SpeakerCreateScreen(speakerCreateBloc: _speakerCreateBloc),
    );
  }
}
