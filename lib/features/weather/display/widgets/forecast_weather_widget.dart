import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/features/weather/display/controllers/units_controller.dart';
import 'package:weather_app/features/weather/domain/entities/weather_forecast_response.dart';

import '../../../../core/utils/helper.dart';
import '../bloc/weather_bloc/forecast_weather_bloc.dart';
import '../bloc/weather_bloc/weather_state.dart';
import '../controllers/weather_controller.dart';

class ForecastWeatherWidget extends StatelessWidget {
  const ForecastWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastWeatherBloc, WeatherState>(
      bloc: Get.find<WeatherController>().forecastWeatherBloc,
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is LoadedForecastWeather) {
          return Card(
            color: Colors.transparent,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: ListView.builder(
                // shrinkWrap: true,
                padding: EdgeInsets.only(
                  top: verticalPadding,
                  bottom: MediaQuery.of(context).padding.bottom + verticalPadding,
                  left: largeHorizontalPadding,
                  right: largeHorizontalPadding,
                ),
                itemCount: state.weatherForecastResponse.list?.length ?? 0,
                itemBuilder: (context, index) => _forecastItem(state.weatherForecastResponse.list![index]),
              ),
              ),
            ),
          );
        } else if (state is Error) {
          return Center(
            child: Text(state.message, style: Get.textTheme.headline1,),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _forecastItem(WeatherList weather) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: smallVerticalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateFormat('HH:mm EEEE').format(DateTime.parse(weather.dtTxt ?? "")),
            style: Get.textTheme.headline1,
          ),
          const Spacer(),
          Text('${weather.main?.temp} ${degreeByUnit()}',
            style: Get.textTheme.headline1,
          ),
        ],
      ),
    );
  }

}
