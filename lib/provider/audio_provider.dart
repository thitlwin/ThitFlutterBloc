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
      return audioCollection.add(audio.toDocument()).then((docRef) async {
        var fileDownloadUrl =
            await putFileToCloudStorage(docRef.id, audio.fileMetaData);
        if (fileDownloadUrl != null) {
          audio.fileMetaData.fileUrl = fileDownloadUrl;
          docRef.update(audio.toDocument());
        }
      }).catchError((Object obj) => throw obj);
    } catch (e) {
      throw e;
    }
  }

  Future<String> putFileToCloudStorage(
      String firestoreObjectId, FileMetaData fileMetaData) async {
    String fileUrl;
    File file = new File(fileMetaData.fileAbsolutePath);

    // Create your custom metadata.
    SettableMetadata metadata = SettableMetadata(
      cacheControl: 'max-age=60',
      customMetadata: <String, String>{
        'firestoreObjectId': '$firestoreObjectId',
      },
    );

    String filePath = 'audio/${fileMetaData.fileName}';
    UploadTask task =
        FirebaseStorage.instance.ref(filePath).putFile(file, metadata);

    task.snapshotEvents.listen(
      (TaskSnapshot snapshot) async {
        print(
            'Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
        if (snapshot.state == TaskState.success) {
          print('----successfully uploaded-----');
        }
      },
      onError: (e) {
        if (e.code == 'permission-denied') {
          print('User does not have permission to upload to this reference.');
        }
        throw e;
      },
    );

    // We can still optionally use the Future alongside the stream.
    try {
      await task;
      if (task.snapshot.state == TaskState.success) {
        fileUrl = await getAudioDownloadUrl(filePath);
        print('---fileUrl--$fileUrl');
        return fileUrl;
      }

      print('Upload complete.');
    } on FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        print('User does not have permission to upload to this reference.');
      }
    }
    return fileUrl;
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

  Future<String> getAudioDownloadUrl(String filePath) async {
    return await FirebaseStorage.instance.ref(filePath).getDownloadURL();
  }

  // @override
  // Future<void> updateAudio(Audio update) {
  //   return todoCollection.doc(update.id).update(update.toEntity().toDocument());
  // }
}
