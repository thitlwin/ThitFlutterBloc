import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class Note extends Equatable {
  final int id;
  final String note;
  final int read_flag;

  Note({this.id, this.note, this.read_flag});

  @override
  List<Object> get props => [this.id, this.note, this.read_flag];

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  @override
  String toString() {
    return "{'id': ${this.id}, 'name': ${this.note}, 'real_flag': ${this.read_flag}}";
  }
}
