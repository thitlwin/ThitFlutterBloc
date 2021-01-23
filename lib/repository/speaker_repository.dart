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
}
