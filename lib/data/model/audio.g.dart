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
    genreId: json['genreId'] as String,
    speaker: json['speaker'] as String,
    speakerId: json['speakerId'] as String,
    fileMetaData: json['fileMetaData'] == null
        ? null
        : FileMetaData.fromJson(json['fileMetaData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AudioToJson(Audio instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'genreId': instance.genreId,
      'genre': instance.genre,
      'speakerId': instance.speakerId,
      'speaker': instance.speaker,
      'fileMetaData': instance.fileMetaData,
    };
