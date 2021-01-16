import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/ui/audio/audio_list/index.dart';

class AudioListScreen extends StatefulWidget {
  const AudioListScreen({
    Key key,
    @required AudioListBloc audioListBloc,
  })  : _audioListBloc = audioListBloc,
        super(key: key);

  final AudioListBloc _audioListBloc;

  @override
  AudioListScreenState createState() {
    return AudioListScreenState();
  }
}

class AudioListScreenState extends State<AudioListScreen> {
  AudioListScreenState();

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
    return BlocBuilder<AudioListBloc, AudioListState>(
        cubit: widget._audioListBloc,
        builder: (
          BuildContext context,
          AudioListState currentState,
        ) {
          if (currentState is UnAudioListState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorAudioListState) {
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
          if (currentState is InAudioListState) {
            if (currentState.audioList?.length > 0) {
              return ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  for (int index = 0;
                      index < currentState.audioList.length;
                      index++)
                    ListTile(
                      leading: ExcludeSemantics(
                        child: CircleAvatar(child: Text('$index')),
                      ),
                      title: Text('${currentState.audioList[index].title}'),
                      subtitle:
                          Text('${currentState.audioList[index].speaker}'),
                    ),
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("No audio list found."),
                  ],
                ),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load() {
    widget._audioListBloc.add(LoadAudioListEvent());
  }
}
