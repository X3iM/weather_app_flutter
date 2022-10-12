import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/features/weather/display/bloc/weather_bloc/current_weather_bloc.dart';
import 'package:weather_app/features/weather/display/bloc/weather_bloc/weather_state.dart';
import 'package:weather_app/features/weather/display/controllers/weather_controller.dart';

import '../../../../core/utils/helper.dart';


class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, WeatherState>(
      bloc: Get.find<WeatherController>().currentWeatherBloc,
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is LoadedCurrentWeather) {

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: largeHorizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.weatherResponse.name ?? "", style: Get.textTheme.headline2,),
                SizedBox(height: verticalPadding,),
                Text(
                  '${getWeatherIcon(state.weatherResponse.cod)} ${state.weatherResponse.main?.temp} ${degreeByUnit()}',
                  style: Get.textTheme.headline1,
                ),
                SizedBox(height: verticalPadding,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text('${'humidity'.tr}: ', style: Get.textTheme.bodyText1,),
                        Text(state.weatherResponse.main?.humidity?.toString() ?? "--", style: Get.textTheme.bodyText1,),
                      ],
                    ),
                    Row(
                      children: [
                        Text('${'pressure'.tr}: ', style: Get.textTheme.bodyText1,),
                        Text(state.weatherResponse.main?.pressure?.toString() ?? "--", style: Get.textTheme.bodyText1,),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (state is Error) {
          return Center(
            child: Text(state.message, style: Get.textTheme.headline1,),
          );
        } else {
          return Container();
        }
      }
    );
  }

}
