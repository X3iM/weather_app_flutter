import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:weather_app/core/utils/storage/cities_storage.dart';
import 'package:weather_app/features/weather/display/controllers/weather_controller.dart';

import '../../../../core/utils/address_search.dart';
import '../../../../core/utils/suggestion.dart';
import '../../data/models/weather_forecast_model.dart';

class CitiesController extends GetxController {
  static const updateCurrentCity = 'update_current_city';

  final CitiesStorage _citiesStorage = CitiesStorage();

  List<CityModel> storedCity = [];
  CityModel? currentCity;


  @override
  void onInit() {
    super.onInit();

    initStorage();
  }

  Future<CitiesController> initStorage() async {
    await _citiesStorage.init();
    storedCity = _citiesStorage.getData();
    currentCity = await _citiesStorage.getCurrentCity();

    if (storedCity.isEmpty) {
      searchNewCity();
    } else {
      _getWeatherData();
    }

    return this;
  }

  Future setCurrentCity(CityModel newCity) async {
    _citiesStorage.setCurrentCity(newCity);
    currentCity = newCity;

    _getWeatherData();
    update([updateCurrentCity]);
  }

  Future _addCity(CityModel newCity) async {
    await _citiesStorage.addData(newCity);
    storedCity = _citiesStorage.getData();
    setCurrentCity(newCity);
  }

  Future deleteCity(CityModel city) async {
    if (storedCity.length > 1) {
      await _citiesStorage.delete(city);
      storedCity = _citiesStorage.getData();

      if (currentCity?.id == city.id) {
        currentCity = storedCity.first;
        _getWeatherData();
      }

      update([updateCurrentCity]);
    }
  }

  Future searchNewCity() async {
    final sessionToken = const Uuid().v4();
    final Suggestion? result = await showSearch(
      context: Get.context!,
      delegate: AddressSearch(sessionToken),
    );
    if (result != null) {
      CityModel newCity = CityModel(id: result.placeId, name: result.description);
      await _addCity(newCity);
    }
  }

  void _getWeatherData() {
    Get.find<WeatherController>().getWeatherData();
  }

  @override
  void dispose() {
    super.dispose();
    _citiesStorage.close();
  }

}