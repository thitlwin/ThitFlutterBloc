// import 'package:flutter/cupertino.dart';
// import 'package:thit_flutter_bloc/data/model/speaker.dart';
// import 'package:thit_flutter_bloc/provider/speaker_provider.dart';

// class NoteRepository {
//   final NoteProvider _noteProvider = NoteProvider();

//   Future<String> authenticate({
//     @required String note,
//     @required String read_flag,
//   }) async {
//     await Future.delayed(Duration(seconds: 1));
//     // TODO - to write code for getting auth token from server here
//     return 'token';
//   }

//   Future<void> deleteToken() async {
//     /// delete from keystore/keychain
//     await _noteProvider.deleteToken();
//     return;
//   }

//   Future<void> persistToken(String token) async {
//     /// write to keystore/keychain
//     await _noteProvider.saveAuthToken(token);
//     return;
//   }

//   Future<bool> hasToken() async {
//     /// read from keystore/keychain
//     var token = await _noteProvider.getAuthToken();
//     return token != null ? true : false;
//   }

//   Future saveNote(Note note) async {
//     return _noteProvider.saveNoteToDB(note);
//   }

//   Future loadNote() async {
//     return _noteProvider.getAllNote();
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thit_flutter_bloc/data/model/speaker.dart';
import 'package:thit_flutter_bloc/provider/speaker_provider.dart';

class SpeakerRepository {
  final SpeakerProvider _speakerProvider = SpeakerProvider();

  SpeakerRepository();

  Future addSpeaker(Speaker speaker) {
    return _speakerProvider.addNewSpeaker(speaker);
  }

  Stream<List<Speaker>> getSpeakerList() {
    return _speakerProvider.speakers();
  }

  // Future loadUser() async {
  //   return _speakerProvider.getAllUser();
  // }
}
