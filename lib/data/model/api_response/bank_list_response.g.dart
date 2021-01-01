// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankListResponse _$BankListResponseFromJson(Map<String, dynamic> json) {
  return BankListResponse(
    (json['banks'] as List)
        ?.map(
            (e) => e == null ? null : Bank.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..responseCode = json['response_code'] as int
    ..responseMessage = json['response_message'] as String;
}

Map<String, dynamic> _$BankListResponseToJson(BankListResponse instance) =>
    <String, dynamic>{
      'response_code': instance.responseCode,
      'response_message': instance.responseMessage,
      'banks': instance.banks,
    };
