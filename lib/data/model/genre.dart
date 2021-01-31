import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'genre.g.dart';

@JsonSerializable()
class Genre extends Equatable {
  final String id;
  final String genreName;

  Genre({this.id, this.genreName});

  @override
  List<Object> get props => [this.id, this.genreName];

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$GenreToJson(this);

  @override
  String toString() {
    return "{'id': ${this.id}, 'genreName': ${this.genreName}}";
  }

  static Genre fromSnapshot(DocumentSnapshot snap) {
    return Genre(
      genreName: snap.data()['genreName'],
      id: snap.id,
    );
  }

  Map<String, Object> toDocument() {
    return {
      'genreName': genreName,
    };
  }
}
