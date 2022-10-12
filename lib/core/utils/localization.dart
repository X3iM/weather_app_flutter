import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_EN': {
      'app_title': 'Weather Forecast',
      'cache_error': 'Cache error',
      'humidity': 'Humidity',
      'pressure': 'Pressure',
      'forecast_weather': 'Forecast weather',
      'enter_your_address': 'Enter your address',
      'loading': 'Loading',
      'settings': 'Settings',
      'units_of_measurement': 'Units of measurement',
      'metric': 'Metric',
      'imperial': 'Imperial',
      'add_city': 'Add city',
      'your_cities': 'Your cities',
      'no_internet_connection': 'No internet connection',
      'error': 'Error',
    }
  };

}