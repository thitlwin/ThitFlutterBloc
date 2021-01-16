// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note(
    id: json['id'] as int,
    note: json['note'] as String,
    read_flag: json['read_flag'] as int,
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'id': instance.id,
      'note': instance.note,
      'read_flag': instance.read_flag,
    };
