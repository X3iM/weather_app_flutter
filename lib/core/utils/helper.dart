import 'package:get/get.dart';

import '../../features/weather/display/controllers/units_controller.dart';

String degreeByUnit() {
  return Get.find<UnitsController>().currentUnit == 'metric' ? '°C' : '';
}

String getWeatherIcon(int? condition) {
  if (condition == null) return '';

  if (condition < 300) {
    return '🌩';
  } else if (condition < 400) {
    return '🌧';
  } else if (condition < 600) {
    return '☔️';
  } else if (condition < 700) {
    return '☃️';
  } else if (condition < 800) {
    return '🌫';
  } else if (condition == 800) {
    return '☀️';
  } else if (condition <= 804) {
    return '☁️';
  } else {
    return '🤷‍';
  }
}
