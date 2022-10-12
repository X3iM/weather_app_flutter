import 'package:get/get.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/display/bloc/weather_bloc/current_weather_bloc.dart';
import 'package:weather_app/features/weather/domain/usecases/get_current_weather.dart';
import 'package:weather_app/features/weather/domain/usecases/get_forecast_weather.dart';

import '../../../../core/widgets/weather_app_bar.dart';
import '../bloc/weather_bloc/forecast_weather_bloc.dart';
import '../bloc/weather_bloc/weather_event.dart';
import '../widgets/current_weather_widget.dart';
import '../widgets/forecast_weather_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const WeatherAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: CurrentWeatherWidget()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: largeHorizontalPadding),
              child: Text('forecast_weather'.tr, style: Get.textTheme.headline2,),
            ),
            SizedBox(height: verticalPadding,),
            const Expanded(
              flex: 2,
              child: ForecastWeatherWidget(),
            ),
          ],
        ),
      ),
    );
  }

}
