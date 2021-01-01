import 'package:json_annotation/json_annotation.dart';
import 'package:thit_flutter_bloc/data/model/bank.dart';

import 'base_response.dart';

part 'bank_list_response.g.dart';

@JsonSerializable()
class BankListResponse extends BaseResponse {
  List<Bank> banks;

  BankListResponse(this.banks);

  factory BankListResponse.fromJson(Map<String, dynamic> json) =>
      _$BankListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BankListResponseToJson(this);
}
