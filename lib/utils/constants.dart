import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ApiConstant {
  static const baseUrl = "https://run.mocky.io/v3/";
  static const language = "en-US";
  static const apiKey = "API_KEY";

  static BaseOptions options =
      new BaseOptions(connectTimeout: 6000, receiveTimeout: 6000);
  // static Dio dio = Dio(options);
}

class AppConstant {
  static final String appName = "Thit Bloc";
  static final jsonDateFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
  static final desiredDateFormat = DateFormat('EEE, d MMM yyyy');
}

class DatabaseConstant {
  static const databaseVersion = 2;
  static const databaseName = "thit_bloc_db";
}
