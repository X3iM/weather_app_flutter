import 'package:dio/dio.dart';

abstract class NetworkService {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/';
  static const String _apiKey = 'a87e3de2d8b90508138443822a7e1e7d';

  static final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl, queryParameters: {'appid': _apiKey},));

  Dio get dio => _dio;
}