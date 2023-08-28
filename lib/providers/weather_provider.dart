import 'package:app_5/models/weather_model.dart';
import 'package:flutter/material.dart';

class weatherProvider extends ChangeNotifier {
  String? cityName;
  WeatherModel? _weatherData;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
