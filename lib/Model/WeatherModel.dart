class WeatherModel {
  final temp;
  final pressure;
  final humidity;
  final maxTemp;
  final minTemp;

  double get getTemp => temp * 1.0;
  double get getMaxTemp => maxTemp * 1.0;
  double get getMinTemp => minTemp * 1.0;

  WeatherModel({
    this.temp,
    this.pressure,
    this.humidity,
    this.maxTemp,
    this.minTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: json["temp"],
      pressure: json["pressure"],
      humidity: json["humidity"],
      maxTemp: json["temp_max"],
      minTemp: json["temp_min"],
    );
  }
}
