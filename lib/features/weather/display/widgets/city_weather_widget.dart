import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/features/weather/data/models/weather_forecast_model.dart';
import 'package:weather_app/features/weather/display/controllers/cities_controller.dart';

class CityWeatherWidget extends StatelessWidget {
  final CityModel city;
  final CityModel currentCity;

  const CityWeatherWidget({
    required this.city,
    required this.currentCity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding,),
        child: Row(
          children: [
            Text(city.name ?? '', style: Get.textTheme.bodyText1?.copyWith(color: Get.theme.indicatorColor),),
            const Spacer(),
            Checkbox(
              value: city.id == currentCity.id,
              onChanged: (value) => Get.find<CitiesController>().setCurrentCity(city),
            ),
            IconButton(
              onPressed: () => Get.find<CitiesController>().deleteCity(city),
              splashRadius: smallIconSize,
              icon: Icon(Icons.delete_forever, color: Get.theme.errorColor, size: smallIconSize),
            ),
          ],
        ),
      ),
    );
  }

}
