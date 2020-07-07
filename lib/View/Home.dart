import 'package:bloc_weather_app/Widgets/AdaptiveProgressIndicator.dart';
import 'package:bloc_weather_app/Widgets/SearchResaults.dart';
import 'package:bloc_weather_app/Widgets/TextField.dart';
import 'package:bloc_weather_app/bloc/weather_bloc.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart' hide TextField;
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String cityName = "";
  @override
  Widget build(BuildContext context) {
    final weatherProvider = BlocProvider.of<WeatherBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Container(
              child: FlareActor(
                "assets/WorldSpin.flr",
                fit: BoxFit.contain,
                animation: "roll",
              ),
              height: 300,
              width: 300,
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherInitial) {
                return TextField(
                  weatherProvider: weatherProvider,
                  onSearch: (name) {
                    cityName = name[0].toUpperCase() + name.substring(1);
                  },
                );
              } else if (state is WeatherLoading) {
                return Center(
                  child: AdaptiveProgessIndicator(
                    cupetinoRadius: 20,
                  ),
                );
              } else if (state is WeatherLoaded) {
                return ShowWeather(
                  weatherProvider: weatherProvider,
                  weather: state.weatherModel,
                  city: cityName,
                );
              } else if (state is WeatherLoadingError) {
                return GestureDetector(
                  onTap: () {
                    weatherProvider.add(ResetWeatherSearch());
                  },
                  child: Center(
                    child: Text(
                      "Error ${state.message}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ),
                );
              }
              return Center(child: AdaptiveProgessIndicator());
            },
          ),
        ),
      ],
    );
  }
}
