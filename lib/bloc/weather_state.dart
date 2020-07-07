part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoaded({this.weatherModel});
  @override
  List<Object> get props => [weatherModel];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadingError extends WeatherState {
  final String message;

  WeatherLoadingError({this.message});

  @override
  List<Object> get props => [message];
}
