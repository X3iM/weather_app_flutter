import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/main_bindings.dart';

import 'core/routes/pages.dart';
import 'core/routes/routes.dart';
import 'core/utils/localization.dart';
import 'core/utils/theme.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Localization(),
      locale: const Locale('en'),
      theme: themes[0],
      title: 'app_title'.tr,
      getPages: Pages.getPages(),
      initialRoute: Routes.WEATHER_SCREEN,
      initialBinding: MainBinding(),
    );
  }

}