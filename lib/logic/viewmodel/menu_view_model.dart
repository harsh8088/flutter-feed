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
          title: "Jokes",
          menuColor: Color(0xff7f5741),
          icon: Icons.sentiment_satisfied,
          image: UIData.timelineImage,
          items: [
            "Jokes",
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
          title: "Dashboard",
          menuColor: Color(0xff261d33),
          icon: Icons.dashboard,
          image: UIData.dashboardImage,
          items: ["Dashboard 1", "Dashboard 2", "Dashboard 3", "Dashboard 4"]),
      Menu(
          title: "Login",
          menuColor: Color(0xffc7d8f4),
          icon: Icons.send,
          image: UIData.loginImage,
          items: ["Login", "Sign Up", "Login 4"]),
      Menu(
          title: "Settings",
          menuColor: Color(0xff2a8ccf),
          icon: Icons.settings,
          image: UIData.settingsImage,
          items: ["Device Settings", "Settings 2", "Settings 3", "Settings 4"]),
      Menu(
          title: "No Item",
          menuColor: Color(0xffe19b6b),
          icon: Icons.not_interested,
          image: UIData.blankImage,
          items: ["No Search Result", "No Internet", "No Item 3", "No Item 4"]),
    ];
  }
}
