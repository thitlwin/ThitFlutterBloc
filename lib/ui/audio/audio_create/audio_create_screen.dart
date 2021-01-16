import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/data/model/audio.dart';
import 'package:thit_flutter_bloc/ui/audio/audio_create/index.dart';

class AudioCreateScreen extends StatefulWidget {
  const AudioCreateScreen({
    Key key,
    @required AudioCreateBloc audioCreateBloc,
  })  : _audioCreateBloc = audioCreateBloc,
        super(key: key);

  final AudioCreateBloc _audioCreateBloc;

  @override
  AudioCreateScreenState createState() {
    return AudioCreateScreenState();
  }
}

class AudioCreateScreenState extends State<AudioCreateScreen> {
  ThemeData themeData;
  AudioCreateScreenState();
  final titleController = TextEditingController();
  final genreController = TextEditingController();
  final speakerController = TextEditingController();

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
    themeData = Theme.of(context);
    genreController.text = "အလုပ်ပေးတရားအလုပ်ပေးတရား";
    speakerController.text = "မိုးကုတ်ဆရာတော်ဘုရားကြီး";
    titleController.text = "သတိနှင့်ဆားဥပမာပြ";
    return BlocListener<AudioCreateBloc, AudioCreateState>(
        cubit: widget._audioCreateBloc,
        listener: (context, currentState) {
          if (currentState is SuccessAudioCreateState) {
            genreController.text = "";
            speakerController.text = "";
            titleController.text = "";
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('Successfully created.'),
              duration: const Duration(seconds: 1),
            ));
          }
        },
        child: _formContent());
  }

  void _load() {
    widget._audioCreateBloc.add(LoadAudioCreateEvent());
  }

  Widget _formContent() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                children: <Widget>[
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Title",
                        border: themeData.inputDecorationTheme.border,
                        enabledBorder: themeData.inputDecorationTheme.border,
                        focusedBorder:
                            themeData.inputDecorationTheme.focusedBorder,
                        prefixIcon: Icon(Icons.title),
                      ),
                      controller: titleController),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Speaker",
                          border: themeData.inputDecorationTheme.border,
                          enabledBorder: themeData.inputDecorationTheme.border,
                          focusedBorder:
                              themeData.inputDecorationTheme.focusedBorder,
                          prefixIcon: Icon(Icons.person),
                        ),
                        controller: speakerController),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Genre",
                          border: themeData.inputDecorationTheme.border,
                          enabledBorder: themeData.inputDecorationTheme.border,
                          focusedBorder:
                              themeData.inputDecorationTheme.focusedBorder,
                          prefixIcon: Icon(Icons.category),
                        ),
                        controller: genreController),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: RaisedButton(
                      onPressed: () {
                        Audio audio = new Audio(
                            title: titleController.text,
                            genre: genreController.text,
                            speaker: speakerController.text);
                        widget._audioCreateBloc.add(DoAudioCreateEvent(audio));
                      },
                      child: Text('Create'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
