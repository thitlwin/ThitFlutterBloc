import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/data/model/speaker.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_create/speaker_create_bloc.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_create/speaker_create_event.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_create/speaker_create_state.dart';

class SpeakerCreateScreen extends StatefulWidget {
  const SpeakerCreateScreen({
    Key key,
    @required SpeakerCreateBloc speakerCreateBloc,
  })  : _speakerCreateBloc = speakerCreateBloc,
        super(key: key);

  final SpeakerCreateBloc _speakerCreateBloc;

  @override
  SpeakerCreateScreenState createState() {
    return SpeakerCreateScreenState();
  }
}

class SpeakerCreateScreenState extends State<SpeakerCreateScreen> {
  ThemeData themeData;
  SpeakerCreateScreenState();
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
    speakerController.text = "မိုးကုတ်ဆရာတော်ဘုရားကြီး";
    return BlocListener<SpeakerCreateBloc, SpeakerCreateState>(
        cubit: widget._speakerCreateBloc,
        listener: (context, currentState) {
          if (currentState is SuccessSpeakerCreateState) {
            speakerController.text = "";
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('Successfully created.'),
              duration: const Duration(seconds: 1),
            ));
          }
        },
        child: _formContent());
  }

  void _load() {
    widget._speakerCreateBloc.add(LoadSpeakerCreateEvent());
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
                          labelText: "Speaker",
                          border: themeData.inputDecorationTheme.border,
                          enabledBorder: themeData.inputDecorationTheme.border,
                          focusedBorder:
                              themeData.inputDecorationTheme.focusedBorder,
                          prefixIcon: Icon(Icons.person),
                        ),
                        controller: speakerController),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: RaisedButton(
                      onPressed: () {
                        Speaker speaker = new Speaker(
                            speaker: speakerController.text);
                        widget._speakerCreateBloc.add(DoSpeakerCreateEvent(speaker));
                      },
                      child: Text('Add'),
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
