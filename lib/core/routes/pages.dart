import 'package:get/get.dart';
import 'package:weather_app/core/routes/routes.dart';
import 'package:weather_app/features/weather/display/pages/settings_screen.dart';
import 'package:weather_app/features/weather/display/pages/weather_screen.dart';

import '../utils/constants.dart';

class Pages {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: Routes.WEATHER_SCREEN,
        page: () => const WeatherScreen(),
        transition: Transition.native,
        transitionDuration: duration,
      ),
      GetPage(
        name: Routes.SETTINGS_SCREEN,
        page: () => const SettingsScreen(),
        transition: Transition.native,
        transitionDuration: duration,
      ),
    ];
  }
}
