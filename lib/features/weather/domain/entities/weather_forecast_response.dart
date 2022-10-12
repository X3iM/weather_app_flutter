import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/data/models/weather_response_model.dart';

import 'weather_response.dart';


class WeatherForecastResponse extends Equatable {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<WeatherList>? list;
  final City? city;

  const WeatherForecastResponse({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  @override
  List<Object?> get props => [cod, message, cnt, list, city];

}

class WeatherList extends Equatable {
  final int? dt;
  final Main? main;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final int? pop;
  final Sys? sys;
  final String? dtTxt;

  const WeatherList({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
  });



  factory WeatherList.fromJson(Map<String, dynamic> json) => WeatherList(
    dt: json['dt'],
    main: MainModel.fromJson(json['main']),
    weather: json['weather'] != null ? List.from(json['weather']).map((e)=>WeatherModel.fromJson(e)).toList() : null,
    clouds: CloudsModel.fromJson(json['clouds']),
    wind: WindModel.fromJson(json['wind']),
    visibility: json['visibility'],
    pop: json['pop'],
    sys: SysModel.fromJson(json['sys']),
    dtTxt: json['dt_txt'],
  );

  @override
  List<Object?> get props => [dt, dt, main, weather, clouds, wind, visibility, pop, sys, dtTxt,];

}

class City extends Equatable {
  final String? id;
  final String? name;
  final CoordModel? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  const City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  @override
  List<Object?> get props => [id, name, coord, country, population, timezone, sunrise, sunset,];

}
