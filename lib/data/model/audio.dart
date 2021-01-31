import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:thit_flutter_bloc/data/model/file_meta_data.dart';

part "audio.g.dart";

@JsonSerializable()
class Audio extends Equatable {
  final int id;
  final String title;
  final String genreId;
  final String genre;
  final String speakerId;
  final String speaker;
  @JsonKey(nullable: true)
  final FileMetaData fileMetaData;

  Audio(
      {this.id,
      this.title,
      this.genre,
      this.genreId,
      this.speaker,
      this.speakerId,
      this.fileMetaData});

  @override
  List<Object> get props => [
        this.id,
        this.title,
        this.genre,
        this.genreId,
        this.speaker,
        this.speakerId,
        this.fileMetaData
      ];

  factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);

  Map<String, dynamic> toJson() => _$AudioToJson(this);

  @override
  String toString() {
    return "{'id': ${this.id}, 'title': ${this.title}, 'genre': ${this.genre}, 'speaker': ${this.speaker}";
  }

  static Audio fromSnapshot(DocumentSnapshot snap) {
    return Audio(
        title: snap.data()['title'],
        genre: snap.data()['genre'],
        genreId: snap.data()['genreId'],
        speaker: snap.data()['speaker'],
        speakerId: snap.data()['speakerId'],
        fileMetaData: snap.data()['fileMetaData'] == null
            ? null
            : FileMetaData.fromJson(snap.data()['fileMetaData']));
  }

  Map<String, Object> toDocument() {
    return {
      'title': title,
      'speakerId': speakerId,
      'speaker': speaker,
      'genreId': genreId,
      'genre': genre,
      'fileMetaData': fileMetaData.toJson()
    };
  }
}
