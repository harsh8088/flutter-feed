import 'package:flutter/material.dart';
import 'package:flutter_feed/ui_data.dart';

class MyAboutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      applicationIcon: FlutterLogo(
        colors: Colors.red,
      ),
      icon: FlutterLogo(
        colors: Colors.red,
      ),
      aboutBoxChildren: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text(
          "by Google",
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          "",
        ),
      ],
      applicationName: UIData.appName,
      applicationVersion: "1.0.1",
      applicationLegalese: "Apache License 2.0",
    );
  }
}
