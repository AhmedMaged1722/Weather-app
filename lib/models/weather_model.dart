import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  @override
  String toString() {
    return 'date = $date ,temp = $temp ,Min Temp = $minTemp ,Max Temp = $maxTemp';
  }

  String getImage() {
    if (weatherStateName == 'Thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherStateName == 'clear' ||
        weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Partly cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Moderate rain') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Thunderstorm') {
      return Colors.orange;
    } else if (weatherStateName == 'clear' ||
        weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Partly cloud') {
      return Colors.lightBlue;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.lightBlue;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Moderate rain') {
      return Colors.blue;
    } else {
      return Colors.orange;
    }
  }
}
