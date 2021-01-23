import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/data/model/audio.dart';
import 'package:thit_flutter_bloc/data/model/file_meta_data.dart';
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

  var isSelectAudioFile = false;
  var audioFileName = "";
  var displayAudioFileValidationError = false;
  var audioFileValidationMessage = "* Please select an audio file.";
  File audioFile;
  @override
  void initState() {
    super.initState();
    _load();
    genreController.text = "အလုပ်ပေးတရားအလုပ်ပေးတရား";
    speakerController.text = "မိုးကုတ်ဆရာတော်ဘုရားကြီး";
    titleController.text = "သတိနှင့်ဆားဥပမာပြ";
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return BlocListener<AudioCreateBloc, AudioCreateState>(
        cubit: widget._audioCreateBloc,
        listener: (context, currentState) {
          if (currentState is SuccessAudioCreateState) {
            genreController.text = "";
            speakerController.text = "";
            titleController.text = "";
            setState(() {
              isSelectAudioFile = false;
            });
            Navigator.pop(context); // hide the CircularProgressIndicator
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('Successfully created.'),
              duration: const Duration(seconds: 1),
            ));
          } else if (currentState is ErrorAudioCreateState) {
            Navigator.pop(context); // hide the CircularProgressIndicator
            showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                title: Text(currentState.errorMessage),
              ),
            );
          } else if (currentState is UnAudioCreateState) {
            showDialog(
              context: context,
              builder: (context) => Center(child: CircularProgressIndicator()),
            );
          } else if (currentState is InAudioCreateState) {
            Navigator.pop(context); // hide the CircularProgressIndicator
          }
        },
        child: _formContent());
  }

  void _load() {
    widget._audioCreateBloc.add(LoadAudioCreateEvent());
  }

  Widget _formContent() {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            enabledBorder:
                                themeData.inputDecorationTheme.border,
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
                            enabledBorder:
                                themeData.inputDecorationTheme.border,
                            focusedBorder:
                                themeData.inputDecorationTheme.focusedBorder,
                            prefixIcon: Icon(Icons.category),
                          ),
                          controller: genreController),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                      child: Row(
                        children: [
                          Expanded(child: Text('Audio file')),
                          OutlineButton(
                            child: Text('Add'),
                            onPressed: () async {
                              FilePickerResult result =
                                  await FilePicker.platform.pickFiles();

                              if (result != null) {
                                audioFile = File(result.files.single.path);
                                setState(() {
                                  isSelectAudioFile = true;
                                  displayAudioFileValidationError = false;
                                  audioFileName = result.files.single.name;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    isSelectAudioFile
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: ListTile(
                                leading: Icon(Icons.audiotrack),
                                title: Text(audioFileName),
                                trailing: IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    setState(() {
                                      isSelectAudioFile = false;
                                      audioFileName = null;
                                    });
                                  },
                                )),
                          )
                        : Container(),
                    displayAudioFileValidationError
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              audioFileValidationMessage,
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        tooltip: 'Save',
        onPressed: () async {
          if (audioFile == null) {
            setState(() {
              displayAudioFileValidationError = true;
            });
            return;
          }
          FileMetaData fileMetaData = new FileMetaData(
              fileAbsolutePath: audioFile.path,
              fileName: audioFileName,
              fileSize: await audioFile.length());

          Audio audio = new Audio(
              title: titleController.text,
              genre: genreController.text,
              speaker: speakerController.text,
              fileMetaData: fileMetaData);
          widget._audioCreateBloc.add(DoAudioCreateEvent(audio));
        },
      ),
    );
  }
}
