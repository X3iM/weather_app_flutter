import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/features/weather/display/controllers/cities_controller.dart';
import 'package:weather_app/features/weather/display/controllers/units_controller.dart';

import '../../../../core/widgets/weather_app_bar.dart';
import '../widgets/city_weather_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeatherBackAppBar(
        title: 'settings'.tr,
      ),
      body: Padding(
        padding: defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('units_of_measurement'.tr, style: Get.textTheme.bodyText1?.copyWith(color: Get.theme.indicatorColor),),
            GetBuilder<UnitsController>(
              id: UnitsController.unitsUpdate,
              builder: (controller) {
                return Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        dense: true,
                        title: Text(
                          'metric'.tr,
                          style: Get.theme.textTheme.bodyText2?.copyWith(color: Get.theme.indicatorColor),
                        ),
                        value: 'metric',
                        groupValue: controller.currentUnit,
                        activeColor: Get.theme.indicatorColor,
                        onChanged: (value) => controller.setUnit(value),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        dense: true,
                        title: Text(
                          'imperial'.tr,
                          style: Get.theme.textTheme.bodyText2?.copyWith(color: Get.theme.indicatorColor,),
                        ),
                        value: 'imperial',
                        groupValue: controller.currentUnit,
                        activeColor: Get.theme.indicatorColor,
                        onChanged: (value) => controller.setUnit(value),
                      ),
                    ),
                  ],
                );
              }
            ),
            SizedBox(height: verticalPadding,),
            TextButton(
              onPressed: () {
                Get.find<CitiesController>().searchNewCity();
              },
              child: Row(
                children: [
                  Icon(Icons.add, size: smallIconSize, color: Get.theme.indicatorColor,),
                  SizedBox(width: horizontalPadding,),
                  Text(
                    'add_city'.tr,
                    style: Get.theme.textTheme.bodyText2?.copyWith(color: Get.theme.indicatorColor,),
                  )
                ],
              ),
            ),
            SizedBox(height: verticalPadding,),
            Text('your_cities'.tr, style: Get.theme.textTheme.bodyText1?.copyWith(color: Get.theme.indicatorColor,)),
            SizedBox(height: smallVerticalPadding,),
            Expanded(
              child: GetBuilder<CitiesController>(
                id: CitiesController.updateCurrentCity,
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.storedCity.length,
                    itemBuilder: (context, index) {
                      return CityWeatherWidget(
                        city: controller.storedCity[index],
                        currentCity: controller.currentCity!,
                      );
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }


}
