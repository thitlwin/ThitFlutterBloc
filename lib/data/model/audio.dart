import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:thit_flutter_bloc/data/model/file_meta_data.dart';

part "audio.g.dart";

@JsonSerializable()
class Audio extends Equatable {
  final int id;
  final String title;
  final String genre;
  final String speaker;
  @JsonKey(nullable: true)
  final FileMetaData fileMetaData;

  Audio({this.id, this.title, this.genre, this.speaker, this.fileMetaData});

  @override
  List<Object> get props =>
      [this.id, this.title, this.genre, this.speaker, this.fileMetaData];

  factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);

  Map<String, dynamic> toJson() => _$AudioToJson(this);

  @override
  String toString() {
    return "{'id': ${this.id}, 'title': ${this.title}, 'genre': ${this.genre}, 'speaker': ${this.speaker}";
  }

  static Audio fromSnapshot(DocumentSnapshot snap) {
    return Audio(
        genre: snap.data()['title'],
        title: snap.data()['genre'],
        speaker: snap.data()['speaker'],
        fileMetaData: snap.data()['fileMetaData'] == null
            ? null
            : FileMetaData.fromJson(snap.data()['fileMetaData']));
  }

  Map<String, Object> toDocument() {
    return {
      'title': title,
      'speaker': speaker,
      'genre': genre,
      'fileMetaData': fileMetaData.toJson()
    };
  }
}
