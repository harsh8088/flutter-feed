import 'package:flutter/material.dart';
import 'package:flutter_feed/model/menu.dart';
import 'package:flutter_feed/ui_data.dart';

class MenuViewModel {
  List<Menu> menuItems;

  MenuViewModel({this.menuItems});

  getMenuItems() {
    return menuItems = <Menu>[
      Menu(
          title: "Timeline",
          menuColor: Color(0xff7f5741),
          icon: Icons.timeline,
          image: UIData.timelineImage,
          items: [
            "Feed",
          ]),
      Menu(
          title: "Weather",
          menuColor: Color(0xff7f5741),
          icon: Icons.landscape,
          image: UIData.timelineImage,
          items: [
            "Weather",
          ]),
      Menu(
          title: "Jokes",
          menuColor: Color(0xff7f5741),
          icon: Icons.sentiment_satisfied,
          image: UIData.timelineImage,
          items: [
            "Jokes",
          ]),
      Menu(
          title: "Camera",
          menuColor: Color(0xff261d33),
          icon: Icons.camera_alt,
          image: UIData.cameraImage,
          items: ["Camera"]),
      Menu(
          title: "Profile",
          menuColor: Color(0xff050505),
          icon: Icons.person,
          image: UIData.profileImage,
          items: [
            "Profile",
          ]),
      Menu(
          title: "Shopping",
          menuColor: Color(0xffc8c4bd),
          icon: Icons.shopping_cart,
          image: UIData.shoppingImage,
          items: [
            "Shopping List",
          ]),
      Menu(
          title: "Payment",
          menuColor: Color(0xffddcec2),
          icon: Icons.payment,
          image: UIData.paymentImage,
          items: [
            "Credit Card",
          ]),
      Menu(
          title: "Maps",
          menuColor: Color(0xff2a8ccf),
          icon: Icons.map,
          image: UIData.mapsImage,
          items: ["Maps"]),
//      Menu(
//          title: "Settings",
//          menuColor: Color(0xff2a8ccf),
//          icon: Icons.settings,
//          image: UIData.settingsImage,
//          items: ["Settings"]),
    ];
  }
}
