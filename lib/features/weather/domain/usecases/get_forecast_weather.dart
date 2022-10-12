import 'package:dartz/dartz.dart';
import 'package:weather_app/core/usecases/usecases.dart';
import 'package:weather_app/features/weather/domain/entities/weather_forecast_response.dart';

import '../../../../core/error/failures.dart';
import '../repositories/weather_repository.dart';

class GetForecastWeather implements UseCase<WeatherForecastResponse, WithParams> {
  final WeatherRepository repository;

  GetForecastWeather({
    required this.repository,
  });

  @override
  Future<Either<Failure, WeatherForecastResponse>> call(WithParams params) async {
    return await repository.getForecastWeather(params);
  }

}
