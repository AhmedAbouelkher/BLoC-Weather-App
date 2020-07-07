import 'package:bloc_weather_app/Model/WeatherModel.dart';
import 'package:bloc_weather_app/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';

class ShowWeather extends StatelessWidget {
  final WeatherModel weather;
  final WeatherBloc weatherProvider;
  final city;

  ShowWeather({this.weather, this.city, this.weatherProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 32, left: 32, top: 10),
      child: Column(
        children: <Widget>[
          Text(
            city,
            style: TextStyle(
                color: Colors.white70,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            weather.getTemp.round().toString() + "°C",
            style: TextStyle(color: Colors.white70, fontSize: 50),
          ),
          Text(
            "Temprature",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    weather.getMinTemp.round().toString() + "°C",
                    style: TextStyle(color: Colors.white70, fontSize: 30),
                  ),
                  Text(
                    "Min Temprature",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    weather.getMaxTemp.round().toString() + "°C",
                    style: TextStyle(color: Colors.white70, fontSize: 30),
                  ),
                  Text(
                    "Max Temprature",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              onPressed: () {
                weatherProvider.add(ResetWeatherSearch());
              },
              color: Colors.lightBlue,
              child: Text(
                "Reserch",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
