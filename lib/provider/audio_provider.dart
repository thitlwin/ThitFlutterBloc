import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:thit_flutter_bloc/data/model/audio.dart';
import 'package:thit_flutter_bloc/data/model/file_meta_data.dart';

class AudioProvider {
  final audioCollection = FirebaseFirestore.instance.collection('audios');
  FirebaseStorage storage =
      FirebaseStorage.instanceFor(bucket: 'dhamma-project-bucket');

  Future<void> addNewAudio(Audio audio) {
    try {
      return audioCollection.add(audio.toDocument()).then((docRef) {
        putFileToCloudStorage(docRef.id, audio.fileMetaData);
      }).catchError((Object obj) => throw obj);
    } catch (e) {
      throw e;
    }
  }

  Future<void> putFileToCloudStorage(
      String firestoreObjectId, FileMetaData fileMetaData) async {
    File file = new File(fileMetaData.fileAbsolutePath);
    // Create your custom metadata.
    SettableMetadata metadata = SettableMetadata(
      cacheControl: 'max-age=60',
      customMetadata: <String, String>{
        'firestoreObjectId': '$firestoreObjectId',
      },
    );

    UploadTask task = FirebaseStorage.instance
        .ref('audio/${fileMetaData.fileName}')
        .putFile(file, metadata);

    task.snapshotEvents.listen((TaskSnapshot snapshot) {
      print('Task state: ${snapshot.state}');
      print(
          'Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
    }, onError: (e) {
      // The final snapshot is also available on the task via `.snapshot`,
      // this can include 2 additional states, `TaskState.error` & `TaskState.canceled`
      print(task.snapshot);

      if (e.code == 'permission-denied') {
        print('User does not have permission to upload to this reference.');
      }
      throw e;
    });

    try {
      // Storage tasks function as a Delegating Future so we can await them.
      TaskSnapshot snapshot = await task;
      print('Uploaded ${snapshot.bytesTransferred} bytes.');
    } on FirebaseException catch (e) {
      // The final snapshot is also available on the task via `.snapshot`,
      // this can include 2 additional states, `TaskState.error` & `TaskState.canceled`
      print(task.snapshot);

      if (e.code == 'permission-denied') {
        print('User does not have permission to upload to this reference.');
      }
      throw e;
    }
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
