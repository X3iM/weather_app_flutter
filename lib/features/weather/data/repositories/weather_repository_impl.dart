import 'package:dartz/dartz.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/usecases/usecases.dart';
import 'package:weather_app/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/features/weather/domain/entities/weather_forecast_response.dart';
import 'package:weather_app/features/weather/domain/entities/weather_response.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;


  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, WeatherResponse>> getCurrentWeather(WithParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await remoteDataSource.getCurrentWeather(params);
        // localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorMessage: e.errorMessage));
      }
    } else {
      try {
        // final localTrivia = await localDataSource.getLastNumberTrivia();
        // return Right(localTrivia);
        return Right(WeatherResponse());
      } on CacheException catch (e) {
        return Left(CacheFailure(errorMessage: 'Cache error: getCurrentWeather'));
      }
    }
  }

  @override
  Future<Either<Failure, WeatherForecastResponse>> getForecastWeather(WithParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await remoteDataSource.getForecastWeather(params);
        // localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorMessage: e.errorMessage));
      }
    } else {
      try {
        // final localTrivia = await localDataSource.getLastNumberTrivia();
        // return Right(localTrivia);
        return Right(WeatherForecastResponse());
      } on CacheException catch (e) {
        return Left(CacheFailure(errorMessage: 'Cache error: getForecastWeather'));
      }
    }
  }

}