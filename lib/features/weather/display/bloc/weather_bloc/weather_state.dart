import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/entities/weather_forecast_response.dart';
import 'package:weather_app/features/weather/domain/entities/weather_response.dart';

@immutable
abstract class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Empty extends WeatherState {}

class Loading extends WeatherState {}

class LoadedCurrentWeather extends WeatherState {
  final WeatherResponse weatherResponse;

  LoadedCurrentWeather({required this.weatherResponse});

  @override
  List<Object> get props => [weatherResponse];
}

class LoadedForecastWeather extends WeatherState {
  final WeatherForecastResponse weatherForecastResponse;

  LoadedForecastWeather({required this.weatherForecastResponse});

  @override
  List<Object> get props => [weatherForecastResponse];
}

class Error extends WeatherState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
