import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/ui/audio/index.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({
    Key key,
    @required AudioBloc audioBloc,
  })  : _audioBloc = audioBloc,
        super(key: key);

  final AudioBloc _audioBloc;

  @override
  AudioScreenState createState() {
    return AudioScreenState();
  }
}

class AudioScreenState extends State<AudioScreen> {
  AudioScreenState();

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
    return BlocBuilder<AudioBloc, AudioState>(
        cubit: widget._audioBloc,
        builder: (
          BuildContext context,
          AudioState currentState,
        ) {
          if (currentState is UnAudioState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorAudioState) {
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
           if (currentState is InAudioState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.hello),
                ],
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator(),
          );
          
        });
  }

  void _load() {
    widget._audioBloc.add(LoadAudioEvent());
  }
}
