import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_weather_app/Controller/WeatherRepo.dart';
import 'package:bloc_weather_app/Model/WeatherModel.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo _weatherRepo;

  WeatherBloc() {
    if (_weatherRepo == null) _weatherRepo = WeatherRepo();
  }

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is LoadWeather) {
      yield WeatherLoading();
      try {
        WeatherModel _weatherModel =
            await _weatherRepo.getWeather(event.cityName);
        yield WeatherLoaded(weatherModel: _weatherModel);
      } catch (e) {
        yield WeatherLoadingError(message: e.toString());
      }
    } else {
      yield WeatherInitial();
    }
  }
}
