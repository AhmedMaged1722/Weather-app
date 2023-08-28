import 'package:app_5/Pages/home_page.dart';
// import 'package:app_5/models/weather_model.dart';
// import 'package:app_5/models/weather_model.dart';
import 'package:app_5/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return weatherProvider();
      },
      child: WeatherApp()));
}

// ignore: must_be_immutable
class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
        primarySwatch: Provider.of<weatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<weatherProvider>(context)
                .weatherData!
                .getThemeColor(),

        // brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
