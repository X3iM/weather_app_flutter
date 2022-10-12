import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/usecases/usecases.dart';

import 'package:weather_app/features/weather/display/bloc/weather_bloc/weather_event.dart';
import 'package:weather_app/features/weather/display/bloc/weather_bloc/weather_state.dart';

import '../../../domain/usecases/get_current_weather.dart';

const CITY = 'q';
const UNITS = 'units';

class CurrentWeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather getCurrentWeather;

  CurrentWeatherBloc({
    required this.getCurrentWeather,
  }) : super(Empty()) {
    on<GetCurrentWeatherEvent>(_onGetCurrentWeatherEvent);
  }

  _onGetCurrentWeatherEvent(GetCurrentWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(Loading());
    final failureOrWeather = await getCurrentWeather(WithParams(params: {
      CITY: event.city,
      UNITS: event.units,
    }));
    failureOrWeather.fold(
      (failure) => emit(Error(message: failure.errorMessage ?? "")),
      (weather) => emit(LoadedCurrentWeather(weatherResponse: weather)),
    );
  }

}