import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/audio/audio_create/index.dart';

class AudioCreatePage extends StatefulWidget {
  static const String routeName = '/audioCreate';

  @override
  _AudioCreatePageState createState() => _AudioCreatePageState();
}

class _AudioCreatePageState extends State<AudioCreatePage> {
  final _audioCreateBloc = AudioCreateBloc(UnAudioCreateState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Create'),
      ),
      body: AudioCreateScreen(audioCreateBloc: _audioCreateBloc),
    );
  }
}
