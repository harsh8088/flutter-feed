import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feed/model/forecastData.dart';
import 'package:flutter_feed/model/weatherData.dart';
import 'package:flutter_feed/ui_data.dart';
import 'package:flutter_feed/widgets/weather.dart';
import 'package:flutter_feed/widgets/weatherItem.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class WeatherPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool isLoading = false;
  WeatherData weatherData;
  ForecastData forecastData;
  Location _location = new Location();
  String error;

  @override
  void initState() {
    super.initState();

    loadWeather();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(UIData.weatherSunny),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
                backgroundColor: Colors.black12,
                appBar: AppBar(
                  title: Text('Weather'),
                ),
                body: Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: <
                        Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: weatherData != null
                                  ? Weather(weather: weatherData)
                                  : Container(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: isLoading
                                  ? CircularProgressIndicator(
                                strokeWidth: 2.0,
                                valueColor:
                                new AlwaysStoppedAnimation(Colors.yellow),
                              )
                                  : IconButton(
                                icon: new Icon(Icons.refresh),
                                tooltip: 'Refresh',
                                onPressed: loadWeather,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200.0,
                            child: forecastData != null
                                ? ListView.builder(
                                itemCount: forecastData.list.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    WeatherItem(
                                        weather:
                                        forecastData.list.elementAt(index)))
                                : Container(),
                          ),
                        ),
                      )
                    ])))));
  }

  loadWeather() async {
    setState(() {
      isLoading = true;
    });

    Map<String, double> location;

    try {
      location = await _location.getLocation();

      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
        'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }

    if (location != null) {
      final lat = location['latitude'];
      final lon = location['longitude'];

      final weatherResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?APPID=${UIData
              .ApiKey}&lat=${lat.toString()}&lon=${lon
              .toString()}&units=metric');
      final forecastResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/forecast?APPID=${UIData
              .ApiKey}&lat=${lat.toString()}&lon=${lon
              .toString()}&units=metric');

      if (weatherResponse.statusCode == 200 &&
          forecastResponse.statusCode == 200) {
        return setState(() {
          weatherData =
          new WeatherData.fromJson(jsonDecode(weatherResponse.body));
          forecastData =
          new ForecastData.fromJson(jsonDecode(forecastResponse.body));
          isLoading = false;
        });
      }
    }

    setState(() {
      isLoading = false;
    });
  }
}
