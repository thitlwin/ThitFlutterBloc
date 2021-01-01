import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "bank.g.dart";

@JsonSerializable()
class Bank extends Equatable {
  final int id;
  final String name;

  Bank({this.id, this.name});

  @override
  List<Object> get props => [this.id, this.name];

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$BankToJson(this);
}
