import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thit_flutter_bloc/data/model/speaker.dart';

class SpeakerProvider {
  final speakerCollection = FirebaseFirestore.instance.collection('speakers');

  @override
  Future<void> addNewSpeaker(Speaker speaker) {
    return speakerCollection.add(speaker.toDocument());
  }

  Stream<List<Speaker>> speakers() {
    return speakerCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Speaker.fromSnapshot(doc)).toList();
    });
  }
}
