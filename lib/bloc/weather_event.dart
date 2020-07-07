part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class LoadWeather extends WeatherEvent {
  final String cityName;
  LoadWeather({this.cityName});
  @override
  List<Object> get props => [cityName];
}

class ResetWeatherSearch extends WeatherEvent {
  @override
  List<Object> get props => [];
}
