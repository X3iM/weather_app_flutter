import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/usecases/usecases.dart';
import 'package:weather_app/features/weather/domain/entities/weather_response.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class GetCurrentWeather implements UseCase<WeatherResponse, WithParams> {
  final WeatherRepository repository;


  GetCurrentWeather({
    required this.repository,
  });

  @override
  Future<Either<Failure, WeatherResponse>> call(WithParams params) async {
    return await repository.getCurrentWeather(params);
  }

}