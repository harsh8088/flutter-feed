

import 'package:flutter/material.dart';
import 'package:flutter_feed/widgets/camera_page.dart';

import 'fblogin/auth.dart';
import 'home_page.dart';
import 'menus/credit_card_page.dart';
import 'menus/jokes_page.dart';
import 'menus/login_page.dart';
import 'menus/map_page.dart';
import 'menus/notfound_page.dart';
import 'menus/profile.dart';
import 'menus/shopping.dart';
import 'menus/timeline_one_page.dart';
import 'menus/weather_page.dart';
import 'ui_data.dart';

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: UIData.quickFont,
          primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: HomePage(auth: Auth()),
      //  initialRoute: UIData.mRoute,

      //routes
      routes: <String, WidgetBuilder>{
        UIData.homeRoute: (BuildContext context) => HomePage(auth: Auth()),
        UIData.profileRoute: (BuildContext context) =>
            ProfilePage(auth: Auth()),
        UIData.timelineOneRoute: (BuildContext context) => TimelineOnePage(),
        UIData.jokesRoute: (BuildContext context) => JokesPage(),
        UIData.shoppingRoute: (BuildContext context) => ShoppingPage(),
        UIData.loginRoute: (BuildContext context) => LoginPage(),
        UIData.creditCardRoute: (BuildContext context) => CreditCardPage(),
        UIData.weatherRoute: (BuildContext context) => WeatherPage(),
        UIData.cameraRoute: (BuildContext context) => CameraApp(),
        UIData.mapsRoute: (BuildContext context) => MapPage(),
      },
      onUnknownRoute: (RouteSettings rs) => MaterialPageRoute(
          builder: (context) => NotFoundPage(
                appTitle: UIData.coming_soon,
                icon: Icons.account_balance,
                title: UIData.coming_soon,
                message: "Under Development",
                iconColor: Colors.green,
              )));

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
