import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCurrentWeatherEvent extends WeatherEvent {
  final String city;
  final String units;

  GetCurrentWeatherEvent({
    required this.city,
    required this.units,
  });

  @override
  List<Object?> get props => [city, units];
}

class GetForecastWeatherEvent extends WeatherEvent {
  final String city;
  final String units;

  GetForecastWeatherEvent({
    required this.city,
    required this.units,
  });

  @override
  List<Object?> get props => [city, units];
}
