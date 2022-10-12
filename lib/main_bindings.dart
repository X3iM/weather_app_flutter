import 'package:get/get.dart';

import 'features/weather/display/controllers/weather_controller.dart';

class MainBinding implements Bindings {

  @override
  Future<void> dependencies() async {
    Get.put<WeatherController>(WeatherController());
  }

}