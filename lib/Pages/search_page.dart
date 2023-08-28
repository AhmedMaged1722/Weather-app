import 'package:app_5/Services/weather_services.dart';
import 'package:app_5/models/weather_model.dart';
import 'package:app_5/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({this.updateUi});

  String? cityName;
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              WeatherServices service = WeatherServices();

              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<weatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<weatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              label: Text('Search'),
              hintText: 'Enter a City',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            ),
          ),
        ),
      ),
    );
  }
}
