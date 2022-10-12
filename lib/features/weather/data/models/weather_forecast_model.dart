import 'package:weather_app/features/weather/data/models/weather_response_model.dart';

import '../../domain/entities/weather_forecast_response.dart';
import '../../domain/entities/weather_response.dart';


class WeatherForecastResponseModel extends WeatherForecastResponse {
  const WeatherForecastResponseModel({
    String? cod,
    int? message,
    int? cnt,
    List<WeatherListModel>? list,
    CityModel? city,
  }) : super(
    message: message,
    cod: cod,
    city: city,
    cnt: cnt,
    list: list,
  );

  factory WeatherForecastResponseModel.fromJson(Map<String, dynamic> json) => WeatherForecastResponseModel(
    cod: json['cod'],
    message: json['message'],
    cnt: json['cnt'],
    list: json['list'] != null ? List.from(json['list']).map((e) => WeatherListModel.fromJson(e)).toList() : null,
    city: json['city'] != null ? CityModel.fromJson(json['city']) : null,
  );
}

class WeatherListModel extends WeatherList {
  const WeatherListModel({
    int? dt,
    Main? main,
    List<Weather>? weather,
    Clouds? clouds,
    Wind? wind,
    int? visibility,
    int? pop,
    Sys? sys,
    String? dtTxt,
  }) : super(
    weather: weather,
    clouds: clouds,
    sys: sys,
    dt: dt,
    main: main,
    visibility: visibility,
    wind: wind,
    dtTxt: dtTxt,
    pop: pop,
  );

  factory WeatherListModel.fromJson(Map<String, dynamic> json) => WeatherListModel(
    dt: json['dt'],
    main: json['main'] != null ? MainModel.fromJson(json['main']) : null,
    weather: json['weather'] != null ? List.from(json['weather']).map((e) => WeatherModel.fromJson(e)).toList() : null,
    clouds: json['clouds'] != null ? CloudsModel.fromJson(json['clouds']) : null,
    wind: json['wind'] != null ? WindModel.fromJson(json['wind']) : null,
    visibility: json['visibility'],
    pop: json['pop']?.toInt(),
    sys: json['sys'] != null ? SysModel.fromJson(json['sys']) : null,
    dtTxt: json['dt_txt'],
  );

}

class CityModel extends City {
  const CityModel({
    String? id,
    String? name,
    CoordModel? coord,
    String? country,
    int? population,
    int? timezone,
    int? sunrise,
    int? sunset,
  }) : super(
    id: id,
    name: name,
    coord: coord,
    country: country,
    sunrise: sunrise,
    sunset: sunset,
    population: population,
    timezone: timezone,
  );

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json['id'].toString(),
    name: json['name'],
    coord: json['coord'] != null ? CoordModel.fromJson(json['coord']) : null,
    country: json['country'],
    population: json['population'],
    timezone: json['timezone'],
    sunrise: json['sunrise'],
    sunset: json['sunset'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'coord': coord?.toMap(),
    'country': country,
    'population': population,
    'timezone': timezone,
    'sunrise': sunrise,
    'sunset': sunset,
  };

}
