import 'package:dio/dio.dart';
import 'package:weather_app/core/network/network_service.dart';
import 'package:weather_app/core/usecases/usecases.dart';

import '../../../../core/error/exceptions.dart';
import '../models/weather_forecast_model.dart';
import '../models/weather_response_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherResponseModel> getCurrentWeather(WithParams params);
  Future<WeatherForecastResponseModel> getForecastWeather(WithParams params);
}

class WeatherRemoteDataSourceImpl extends NetworkService implements WeatherRemoteDataSource {

  @override
  Future<WeatherResponseModel> getCurrentWeather(WithParams params) async {
    try {
      final response = await dio.get('/weather', queryParameters: params.params);
      if (response.statusCode == 200) {
        return WeatherResponseModel.fromJson(response.data);
      } else {
        throw ServerException('${response.data}');
      }
    } on Exception catch (e) {
      if (e is DioError) {
        print(e.message);
        throw ServerException(e.message);
      } else if (e is ServerException) {
        throw ServerException(e.errorMessage);
      }
      throw ServerException(e.toString());
    }
  }

  @override
  Future<WeatherForecastResponseModel> getForecastWeather(WithParams params) async {
    try {
      final response = await dio.get('/forecast', queryParameters: params.params);
      if (response.statusCode == 200) {
        return WeatherForecastResponseModel.fromJson(response.data);
      } else {
        throw ServerException('${response.data}');
      }
    } on Exception catch (e) {
      if (e is DioError) {
        print(e.message);
        throw ServerException(e.message);
      } else if (e is ServerException) {
        throw ServerException(e.errorMessage);
      }
      throw ServerException(e.toString());
    }
  }

}