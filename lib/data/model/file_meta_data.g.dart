// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileMetaData _$FileMetaDataFromJson(Map<String, dynamic> json) {
  return FileMetaData(
    fileAbsolutePath: json['fileAbsolutePath'] as String,
    fileName: json['fileName'] as String,
    fileUrl: json['fileUrl'] as String,
    fileSize: json['fileSize'] as int,
  );
}

Map<String, dynamic> _$FileMetaDataToJson(FileMetaData instance) =>
    <String, dynamic>{
      'fileAbsolutePath': instance.fileAbsolutePath,
      'fileName': instance.fileName,
      'fileUrl': instance.fileUrl,
      'fileSize': instance.fileSize,
    };
