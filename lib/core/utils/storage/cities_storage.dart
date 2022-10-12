import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:weather_app/features/weather/data/models/weather_forecast_model.dart';

import 'storage.dart';

const CITIES_BOX = 'cities_box';
const CURRENT_CITY_BOX = 'current_city_box';
const CURRENT_CITY_KEY = 'current_city_key';

class CitiesStorage implements Storage<CityModel> {
  late Box _citiesBox;
  late Box _currentCityBox;

  @override
  Future init() async {
    _citiesBox = await Hive.openBox(CITIES_BOX);
    _currentCityBox = await Hive.openBox(CURRENT_CITY_BOX);
  }

  @override
  Future addData(CityModel data) async {
    if (!containData(data)) {
      await _citiesBox.add(data.toMap());
    }
  }

  Future<CityModel?> getCurrentCity() async {
    final city = await _currentCityBox.get(CURRENT_CITY_KEY);
    if (city != null) {
      return CityModel.fromJson(Map.from(city));
    }
    return null;
  }

  Future setCurrentCity(CityModel city) async {
    await _currentCityBox.put(CURRENT_CITY_KEY, city.toMap());
  }

  @override
  List<CityModel> getData() {
    Iterable storedCities = _citiesBox.values;
    List<CityModel> data = [];
    for (var element in storedCities) {
      data.add(CityModel.fromJson(Map.from(element)));
    }
    return data;
  }

  @override
  bool containData(CityModel data) {
    return _citiesBox.values.any((element) => Map.from(element)['id'] == data.id);
  }

  @override
  void close() {
    _citiesBox.close();
  }

  @override
  Future delete(CityModel city) async {
    List data = _citiesBox.values.toList();
    for (int index = 0; index < data.length; index++) {
      if (city.id == Map.from(data[index])['id']) {
        await deleteAt(index);
        return;
      }
    }
  }

  Future deleteAt(int index) async {
    await _citiesBox.deleteAt(index);
  }

}