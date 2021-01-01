import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:thit_flutter_bloc/data/model/api_response/bank_list_response.dart';
import 'package:thit_flutter_bloc/utils/constants.dart';

part 'api_provider.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String baseUrl}) = _ApiProvider;

// https://run.mocky.io/v3/323b9cc2-10d8-46b4-89d8-4e606a798334
  @GET("/323b9cc2-10d8-46b4-89d8-4e606a798334")
  Future<BankListResponse> getBanks();
}
