import 'package:flutter/material.dart';
import 'package:flutter_feed/model/weatherData.dart';
import 'package:flutter_feed/ui_data.dart';
import 'package:intl/intl.dart';

class WeatherItem extends StatelessWidget {
  final WeatherData weather;

  WeatherItem({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      color: Colors.black.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(weather.name, style: new TextStyle(color: Colors.black)),
            Text(weather.main,
                style: new TextStyle(color: Colors.black, fontSize: 24.0)),
            Text('${weather.temp.toString()}°C',
                style: new TextStyle(color: Colors.black)),
            Image.network(
                'https://openweathermap.org/img/w/${weather.icon}.png'),
            Text(new DateFormat.yMMMd().format(weather.date),
                style: new TextStyle(color: Colors.black)),
            Text(new DateFormat.Hm().format(weather.date),
                style: new TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }

  //stack 1/3
  Widget weatherImage(WeatherData weather) => Image(
        image: NetworkImage(UIData.weatherThunder),
      );

  //stack 2/3
  Widget weatherColor() => new Container(
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 5.0,
          ),
        ]),
      );

  //stack 3/3
  Widget weatherData(WeatherData weather) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(weather.name, style: new TextStyle(color: Colors.black)),
            Text(weather.main,
                style: new TextStyle(color: Colors.black, fontSize: 24.0)),
            Text('${weather.temp.toString()}°F',
                style: new TextStyle(color: Colors.black)),
            Image.network(
                'https://openweathermap.org/img/w/${weather.icon}.png'),
            Text(new DateFormat.yMMMd().format(weather.date),
                style: new TextStyle(color: Colors.black)),
            Text(new DateFormat.Hm().format(weather.date),
                style: new TextStyle(color: Colors.black)),
          ],
        ),
      );
}
