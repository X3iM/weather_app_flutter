import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/usecases/usecases.dart';

import 'package:weather_app/features/weather/display/bloc/weather_bloc/weather_event.dart';
import 'package:weather_app/features/weather/display/bloc/weather_bloc/weather_state.dart';

import '../../../domain/usecases/get_forecast_weather.dart';

const CITY = 'q';
const UNITS = 'units';

class ForecastWeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetForecastWeather getForecastWeather;

  ForecastWeatherBloc({
    required this.getForecastWeather,
  }) : super(Empty()) {
    on<GetForecastWeatherEvent>(_onGetForecastWeatherEvent);
  }

  _onGetForecastWeatherEvent(GetForecastWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(Loading());
    final failureOrWeather = await getForecastWeather(WithParams(params: {
      CITY: event.city,
      UNITS: event.units,
    }));
    failureOrWeather.fold(
      (failure) => emit(Error(message: failure.errorMessage ?? "")),
      (weather) => emit(LoadedForecastWeather(weatherForecastResponse: weather)),
    );
  }

}