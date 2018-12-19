import 'package:flutter/material.dart';
import 'package:flutter_feed/menus/credit_card_page.dart';
import 'package:flutter_feed/fblogin/auth.dart';
import 'package:flutter_feed/menus/login_page.dart';
import 'package:flutter_feed/root_page.dart';
import 'package:flutter_feed/home_page.dart';
import 'package:flutter_feed/menus/notfound_page.dart';
import 'package:flutter_feed/menus/profile.dart';
import 'package:flutter_feed/menus/shopping.dart';
import 'package:flutter_feed/menus/timeline_one_page.dart';
import 'package:flutter_feed/ui_data.dart';

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: UIData.quickFont,
          primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: new RootPage(auth: new Auth()),
      //  initialRoute: UIData.mRoute,

      //routes
      routes: <String, WidgetBuilder>{
        UIData.homeRoute: (BuildContext context) => HomePage(auth: new Auth()),
        UIData.profileRoute: (BuildContext context) =>
            ProfilePage(auth: new Auth()),
        UIData.timelineOneRoute: (BuildContext context) => TimelineOnePage(),
        UIData.shoppingRoute: (BuildContext context) => ShoppingPage(),
        UIData.loginRoute: (BuildContext context) => LoginPage(),
        UIData.creditCardRoute: (BuildContext context) => CreditCardPage(),
      },
      onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
          builder: (context) => new NotFoundPage(
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
