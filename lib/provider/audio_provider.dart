import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thit_flutter_bloc/data/model/audio.dart';

class AudioProvider {
  final audioCollection = FirebaseFirestore.instance.collection('audios');

  Future<void> addNewAudio(Audio audio) {
    return audioCollection.add(audio.toDocument());
  }

  // @override
  // Future<void> deleteAudio(Audio todo) async {
  //   return todoCollection.doc(todo.id).delete();
  // }

  Stream<List<Audio>> audios() {
    return audioCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Audio.fromSnapshot(doc)).toList();
    });
  }

  Future<List<Audio>> audioList() {
    return audioCollection.get().then((value) {
      return value.docs.map((doc) => Audio.fromSnapshot(doc)).toList();
    });
  }

  // @override
  // Future<void> updateAudio(Audio update) {
  //   return todoCollection.doc(update.id).update(update.toEntity().toDocument());
  // }
}
