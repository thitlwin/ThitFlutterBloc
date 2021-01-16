import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/audio/audio_create/index.dart';
import 'package:thit_flutter_bloc/ui/audio/audio_list/index.dart';

class AudioListPage extends StatefulWidget {
  static const String routeName = '/audioList';

  @override
  _AudioListPageState createState() => _AudioListPageState();
}

class _AudioListPageState extends State<AudioListPage> {
  final _audioListBloc = AudioListBloc(UnAudioListState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio List'),
        actions: [
          IconButton(
            tooltip: 'Add New',
            icon: const Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AudioCreatePage.routeName);
            },
          ),
        ],
      ),
      body: AudioListScreen(audioListBloc: _audioListBloc),
    );
  }
}
