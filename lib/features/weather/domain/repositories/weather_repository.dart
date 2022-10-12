import 'package:dartz/dartz.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/usecases/usecases.dart';
import 'package:weather_app/features/weather/domain/entities/weather_forecast_response.dart';
import 'package:weather_app/features/weather/domain/entities/weather_response.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherResponse>> getCurrentWeather(WithParams params);
  Future<Either<Failure, WeatherForecastResponse>> getForecastWeather(WithParams params);
}