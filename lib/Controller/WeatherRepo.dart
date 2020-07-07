import 'package:bloc_weather_app/Controller/api_key.dart';
import 'package:bloc_weather_app/Model/WeatherModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherRepo {
  final String _apiKey = Api.API_KEY;
  final String _url = "https://api.openweathermap.org/data/2.5/weather";
  Future<WeatherModel> getWeather(String city) async {
    final result = await http.get("$_url?q=$city&appid=$_apiKey&units=metric");

    if (result.statusCode != 200) throw result.statusCode.toString();

    return _parsedJson(result.body);
  }

  WeatherModel _parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded["main"];
    return WeatherModel.fromJson(jsonWeather);
  }
}
