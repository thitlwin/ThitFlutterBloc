// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Audio _$AudioFromJson(Map<String, dynamic> json) {
  return Audio(
    id: json['id'] as int,
    title: json['title'] as String,
    genre: json['genre'] as String,
    speaker: json['speaker'] as String,
  );
}

Map<String, dynamic> _$AudioToJson(Audio instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'genre': instance.genre,
      'speaker': instance.speaker,
    };
