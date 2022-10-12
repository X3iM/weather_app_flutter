import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/features/weather/display/controllers/cities_controller.dart';
import 'package:weather_app/features/weather/display/controllers/units_controller.dart';
import 'package:weather_app/features/weather/domain/usecases/get_forecast_weather.dart';

import '../../../../core/network/network_info.dart';
import '../../data/datasources/weather_remote_data_source.dart';
import '../../data/repositories/weather_repository_impl.dart';
import '../../domain/usecases/get_current_weather.dart';
import '../bloc/weather_bloc/current_weather_bloc.dart';
import '../bloc/weather_bloc/forecast_weather_bloc.dart';
import '../bloc/weather_bloc/weather_event.dart';

class WeatherController extends GetxController {

  late CurrentWeatherBloc _currentWeatherBloc;
  late ForecastWeatherBloc _forecastWeatherBloc;

  CurrentWeatherBloc get currentWeatherBloc => _currentWeatherBloc;
  ForecastWeatherBloc get forecastWeatherBloc => _forecastWeatherBloc;

  final StreamSubscription<InternetConnectionStatus> listener = InternetConnectionChecker().onStatusChange.listen(
        (InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          Get.closeCurrentSnackbar();
          break;
        case InternetConnectionStatus.disconnected:
          Get.showSnackbar(GetSnackBar(
            title: 'error'.tr,
            message: 'no_internet_connection'.tr,
            padding: smallDefaultPadding,
            margin: smallDefaultPadding,
            borderRadius: radius,
            isDismissible: false,
          ));
          break;
      }
    },
  );

  @override
  void onInit() {
    super.onInit();

    final weatherRepository = WeatherRepositoryImpl(
      remoteDataSource: WeatherRemoteDataSourceImpl(),
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    );

    _currentWeatherBloc = CurrentWeatherBloc(
      getCurrentWeather: GetCurrentWeather(repository: weatherRepository,),
    );
    _forecastWeatherBloc = ForecastWeatherBloc(
      getForecastWeather: GetForecastWeather(repository: weatherRepository,),
    );

    Get.put<CitiesController>(CitiesController());
    Get.put<UnitsController>(UnitsController());
  }

  void getWeatherData() {
    String? cityName = Get.find<CitiesController>().currentCity?.name;
    String? unit = Get.find<UnitsController>().currentUnit;
    if (cityName != null && unit != null) {
      _currentWeatherBloc.add(
        GetCurrentWeatherEvent(
          city: cityName,
          units: unit,
        ),
      );
      _forecastWeatherBloc.add(
        GetForecastWeatherEvent(
          city: cityName,
          units: unit,
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();

    listener.cancel();
  }

}