import 'package:weather_app/features/weather/domain/entities/weather_response.dart';

class WeatherResponseModel extends WeatherResponse {
  const WeatherResponseModel({
    final CoordModel? coord,
    final List<WeatherModel>? weather,
    final String? base,
    final MainModel? main,
    final int? visibility,
    final WindModel? wind,
    final CloudsModel? clouds,
    final int? dt,
    final SysModel? sys,
    final int? id,
    final String? name,
    final int? cod,
  }): super(
    id: id,
    clouds: clouds,
    wind: wind,
    visibility: visibility,
    coord: coord,
    weather: weather,
    base: base,
    main: main,
    name: name,
    cod: cod,
    dt: dt,
    sys: sys,
  );

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) => WeatherResponseModel(
    coord: json['coord'] != null ? CoordModel.fromJson(json['coord']) : null,
    weather: json['weather'] is Iterable ? (json['weather'] as List).map((e) => WeatherModel.fromJson(e)).toList() : null,
    base: json['base'],
    main: json['main'] != null ? MainModel.fromJson(json['main']) : null,
    visibility: json['visibility'],
    wind: json['wind'] != null ? WindModel.fromJson(json['wind']) : null,
    clouds: json['clouds'] != null ? CloudsModel.fromJson(json['clouds']) : null,
    dt: json['dt'],
    sys: json['sys'] != null ? SysModel.fromJson(json['sys']) : null,
    id: json['id'],
    name: json['name'],
    cod: json['cod'],
  );

}

class CoordModel extends Coord {
  const CoordModel({
    double? lon,
    double? lat,
  }) : super(
    lat: lat,
    lon: lon,
  );

  factory CoordModel.fromJson(Map<String, dynamic> json) => CoordModel(
    lon: json['lon'],
    lat: json['lat'],
  );

  Map<String, dynamic> toMap() => {
    'lat': lat,
    'lon': lon,
  };

}

class WeatherModel extends Weather {
  const WeatherModel({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) : super(
    id: id,
    main: main,
    description: description,
    icon: icon,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    id: json['id'],
    main: json['main'],
    description: json['description'],
    icon: json['icon'],
  );
}

class MainModel extends Main {
  const MainModel({
    double? temp,
    int? pressure,
    int? humidity,
    double? tempMin,
    double? tempMax,
  }) : super(
    humidity: humidity,
    tempMax: tempMax,
    tempMin: tempMin,
    pressure: pressure,
    temp: temp,
  );

  factory MainModel.fromJson(Map<String, dynamic> json) => MainModel(
    temp: json['temp']?.toDouble(),
    pressure: json['pressure']?.toInt(),
    humidity: json['humidity']?.toInt(),
    tempMin: json['temp_min']?.toDouble(),
    tempMax: json['temp_max']?.toDouble(),
  );

}

class WindModel extends Wind {
  const WindModel({
    double? speed,
    int? deg,
  }) : super(
    speed: speed,
    deg: deg,
  );

  factory WindModel.fromJson(Map<String, dynamic> json) => WindModel(
    speed: json['speed']?.toDouble(),
    deg: json['deg'],
  );

}

class CloudsModel extends Clouds {
  const CloudsModel({
    int? all,
  }) : super(
    all: all,
  );

  factory CloudsModel.fromJson(Map<String, dynamic> json) => CloudsModel(
    all: json['all'],
  );
}

class SysModel extends Sys {
  const SysModel({
    int? type,
    int? id,
    double? message,
    String? country,
    int? sunrise,
    int? sunset,
  }) : super(
    id: id,
    sunset: sunset,
    sunrise: sunrise,
    country: country,
    message: message,
    type: type,
  );

  factory SysModel.fromJson(Map<String, dynamic> json) => SysModel(
    type: json['type'],
    id: json['id'],
    message: json['message'],
    country: json['country'],
    sunrise: json['sunrise'],
    sunset: json['sunset'],
  );

}
