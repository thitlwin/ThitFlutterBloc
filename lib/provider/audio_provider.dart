import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thit_flutter_bloc/data/model/audio.dart';

class AudioProvider {
  final todoCollection = FirebaseFirestore.instance.collection('audios');

  @override
  Future<void> addNewAudio(Audio audio) {
    return todoCollection.add(audio.toDocument());
  }

  // @override
  // Future<void> deleteAudio(Audio todo) async {
  //   return todoCollection.doc(todo.id).delete();
  // }

  Stream<List<Audio>> audios() {
    return todoCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Audio.fromSnapshot(doc)).toList();
    });
  }

  // @override
  // Future<void> updateAudio(Audio update) {
  //   return todoCollection.doc(update.id).update(update.toEntity().toDocument());
  // }
}
