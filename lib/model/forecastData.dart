import 'package:flutter_feed/model/weatherData.dart';

class ForecastData {
  final List? list;

  ForecastData({this.list});

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    List list = List.empty(growable: true);

    for (dynamic e in json['list']) {
      WeatherData w = WeatherData(
          date:
              DateTime.fromMillisecondsSinceEpoch(e['dt'] * 1000, isUtc: false),
          name: json['city']['name'],
          temp: e['main']['temp'].toDouble(),
          main: e['weather'][0]['main'],
          icon: e['weather'][0]['icon']);
      list.add(w);
    }

    return ForecastData(
      list: list,
    );
  }
}
