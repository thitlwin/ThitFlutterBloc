import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/audio/index.dart';

class AudioPage extends StatefulWidget {
  static const String routeName = '/audio';

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final _audioBloc = AudioBloc(UnAudioState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio'),
      ),
      body: AudioScreen(audioBloc: _audioBloc),
    );
  }
}
