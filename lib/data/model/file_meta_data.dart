import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_meta_data.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class FileMetaData extends Equatable {
  // @JsonKey(ignore: true)
  final String fileAbsolutePath;
  final String fileName;
  String fileUrl;
  final int fileSize;

  FileMetaData(
      {this.fileAbsolutePath, this.fileName, this.fileUrl, this.fileSize});

  @override
  List<Object> get props =>
      [this.fileAbsolutePath, this.fileName, this.fileUrl, this.fileSize];

  factory FileMetaData.fromJson(Map<String, dynamic> json) =>
      _$FileMetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$FileMetaDataToJson(this);

  @override
  String toString() {
    return "{'fileAbsolutePath': ${this.fileAbsolutePath},'fileName': ${this.fileName}, 'fileUrl': ${this.fileUrl}, 'fileSize': ${this.fileSize}";
  }
}
