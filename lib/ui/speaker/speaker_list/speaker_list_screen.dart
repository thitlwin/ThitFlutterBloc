// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:thit_flutter_bloc/ui/speaker/speaker_list/index.dart';

// class SpeakerListScreen extends StatefulWidget {
//   const SpeakerListScreen({
//     Key key,
//     @required SpeakerListBloc speakerListBloc,
//   })  : _speakerListBloc = speakerListBloc,
//         super(key: key);

//   final SpeakerListBloc _speakerListBloc;

//   @override
//   SpeakerListScreenState createState() {
//     return SpeakerListScreenState();
//   }
// }

// class SpeakerListScreenState extends State<SpeakerListScreen> {
//   SpeakerListScreenState();

//   @override
//   void initState() {
//     super.initState();
//     _load();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SpeakerListBloc, SpeakerListState>(
//         cubit: widget._speakerListBloc,
//         builder: (
//           BuildContext context,
//           SpeakerListState currentState,
//         ) {
//           if (currentState is UnSpeakerListState) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (currentState is ErrorSpeakerListState) {
//             return Center(
//                 child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(currentState.errorMessage ?? 'Error'),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 32.0),
//                   child: RaisedButton(
//                     color: Colors.blue,
//                     child: Text('reload'),
//                     onPressed: _load,
//                   ),
//                 ),
//               ],
//             ));
//           }
//            if (currentState is InSpeakerListState) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(currentState.hello),
//                 ],
//               ),
//             );
//           }
//           return Center(
//               child: CircularProgressIndicator(),
//           );
          
//         });
//   }

//   void _load() {
//     widget._speakerListBloc.add(LoadSpeakerListEvent());
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_list/speaker_list_bloc.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_list/speaker_list_event.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_list/speaker_list_state.dart';

class SpeakerListScreen extends StatefulWidget {
  const SpeakerListScreen({
    Key key,
    @required SpeakerListBloc speakerListBloc,
  })  : _speakerListBloc = speakerListBloc,
        super(key: key);

  final SpeakerListBloc _speakerListBloc;

  @override
  SpeakerListScreenState createState() {
    return SpeakerListScreenState();
  }
}

class SpeakerListScreenState extends State<SpeakerListScreen> {
  SpeakerListScreenState();

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
    return BlocBuilder<SpeakerListBloc, SpeakerListState>(
        cubit: widget._speakerListBloc,
        builder: (
          BuildContext context,
          SpeakerListState currentState,
        ) {
          if (currentState is UnSpeakerListState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorSpeakerListState) {
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
          if (currentState is InSpeakerListState) {
            if (currentState.speakerList?.length > 0) {
              return ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  for (int index = 0;
                      index < currentState.speakerList.length;
                      index++)
                    ListTile(
                      leading: ExcludeSemantics(
                        child: CircleAvatar(child: Text('$index')),
                      ),
                      title: Text("#${currentState.speakerList[index].speaker}"),
                    ),
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("No Speaker found."),
                  ],
                ),
              );
            }
          }
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
        });
  }

  void _load() {
    widget._speakerListBloc.add(LoadSpeakerListEvent());
  }
}
