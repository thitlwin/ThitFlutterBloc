import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "speaker.g.dart";

@JsonSerializable()
class Speaker extends Equatable {
  final String id;
  final String speaker;

  Speaker({this.id, this.speaker});

  @override
  List<Object> get props => [this.id, this.speaker];

  factory Speaker.fromJson(Map<String, dynamic> json) => _$SpeakerFromJson(json);

  Map<String, dynamic> toJson() => _$SpeakerToJson(this);

  @override
  String toString() {
    return "{'id': ${this.id}, 'speaker': ${this.speaker}}";
  }

  static Speaker fromSnapshot(DocumentSnapshot snap) {
    return Speaker(
      id: snap.id,
      speaker: snap.data()['speaker']);
  }

  Map<String, Object> toDocument() {
    return {
      'speaker': speaker,
    };
  }
}
