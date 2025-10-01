import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient({String baseUrl = "https://opentdb.com"})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      ) {
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
