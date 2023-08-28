import 'package:app_5/Pages/search_page.dart';
import 'package:app_5/models/weather_model.dart';
import 'package:app_5/providers/weather_provider.dart';
// import 'package:app_5/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<weatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('    Weather App'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage(
                  updateUi: updateUi,
                );
              }));
            },
            icon: Icon(
              Icons.search,
              size: 32,
            ),
          ),
        ],
      ),
      body: Center(
        child: weatherData == null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'There is no weather 😔 start',
                    style: TextStyle(fontSize: 28),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              )
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    weatherData!.getThemeColor(),
                    weatherData!.getThemeColor()[100]!,
                  ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      Provider.of<weatherProvider>(context).cityName!,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text('Updated: ${weatherData!.date}'),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData!.getImage()),
                        Text(
                          weatherData!.temp.toInt().toString(),
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'max temp: ${weatherData!.maxTemp.toInt()}',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'min temp: ${weatherData!.minTemp.toInt()}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      weatherData?.weatherStateName ?? '',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 6,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
