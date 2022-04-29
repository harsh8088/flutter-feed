import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feed/model/norrisData.dart';
import 'package:flutter_feed/ui_data.dart';
import 'package:flutter_feed/widgets/jokes_page_background.dart';
import 'package:flutter_feed/widgets/jokes_page_row.dart';
import 'package:flutter_feed/widgets/profile_tile.dart';
import 'package:http/http.dart' as http;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JokesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JokeState();
  }

//  https://api.chucknorris.io/jokes/random

}

class _JokeState extends State<JokesPage> {
  late Size deviceSize;
  bool isLoading = false;
  NorrisData? norrisData;

  @override
  void initState() {
    super.initState();
    loadChuckNorris();
  }

  Widget appBarColumn(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 18.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      defaultTargetPlatform == TargetPlatform.android
                          ? Icons.arrow_back
                          : Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.canPop(context)
                        ? Navigator.pop(context)
                        : null,
                  ),
                  ProfileTile(
                    title: "Jokes",
                    subtitle: "Welcome to the Chuck Norris",
                    textColor: Colors.white,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print("hi");
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      );

  Widget searchCard() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    onPressed: () => print("search Icon"),
                    icon: Icon(Icons.search)),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search with category"),
                    onSubmitted: (value) => {},
                  ),
                ),
                Icon(Icons.menu),
              ],
            ),
          ),
        ),
      );

  //["explicit","dev","movie","food","celebrity","science","sport","political","religion","animal","history","music","travel","career","money","fashion"]
  Widget actionMenuCard() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DashboardMenuRow(
                    firstIcon: FontAwesomeIcons.solidUser,
                    firstLabel: "Explicit",
                    firstIconCircleColor: Colors.blue,
                    secondIcon: FontAwesomeIcons.userGroup,
                    secondLabel: "Animal",
                    secondIconCircleColor: Colors.orange,
                    thirdIcon: FontAwesomeIcons.locationDot,
                    thirdLabel: "Movie",
                    thirdIconCircleColor: Colors.purple,
                    fourthIcon: FontAwesomeIcons.locationArrow,
                    fourthLabel: "Food",
                    fourthIconCircleColor: Colors.indigo,
                  ),
                  DashboardMenuRow(
                    firstIcon: FontAwesomeIcons.images,
                    firstLabel: "Celebrity",
                    firstIconCircleColor: Colors.red,
                    secondIcon: FontAwesomeIcons.solidHeart,
                    secondLabel: "Science",
                    secondIconCircleColor: Colors.teal,
                    thirdIcon: FontAwesomeIcons.solidNewspaper,
                    thirdLabel: "Sport",
                    thirdIconCircleColor: Colors.lime,
                    fourthIcon: FontAwesomeIcons.solidCommentDots,
                    fourthLabel: "Political",
                    fourthIconCircleColor: Colors.amber,
                  ),
                  DashboardMenuRow(
                    firstIcon: FontAwesomeIcons.football,
                    firstLabel: "Religion",
                    firstIconCircleColor: Colors.cyan,
                    secondIcon: FontAwesomeIcons.solidStar,
                    secondLabel: "Travel",
                    secondIconCircleColor: Colors.redAccent,
                    thirdIcon: FontAwesomeIcons.blogger,
                    thirdLabel: "Money",
                    thirdIconCircleColor: Colors.pink,
                    fourthIcon: FontAwesomeIcons.wallet,
                    fourthLabel: "Fashion",
                    fourthIconCircleColor: Colors.brown,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget balanceCard() => Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: isLoading
                          ? CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor: AlwaysStoppedAnimation(Colors.yellow),
                            )
                          : IconButton(
                              icon: Icon(Icons.refresh),
                              tooltip: 'Refresh',
                              onPressed: loadChuckNorris,
                              color: Colors.yellow,
                            ),
                    ),
                    Expanded(
                      child: Text(
                        norrisData!.value!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: UIData.ralewayFont,
                          fontWeight: FontWeight.w700,
                          color: Colors.green,
                        ),
                      ),
                    )
                  ],
                ),
                Align(
                    alignment: Alignment(1.0, 0.0),
                    child: Image(
                      alignment: Alignment(1.0, 0.1),
                      image: NetworkImage(norrisData!.iconUrl!),
                    ))
              ],
            ),
          ),
        ),
      );

  Widget allCards(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            appBarColumn(context),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            searchCard(),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            actionMenuCard(),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            balanceCard(),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          JokesBackground(
            showIcon: false,
          ),
          allCards(context),
        ],
      ),
    );
  }

  void loadChuckNorris() async {
    setState(() {
      isLoading = true;
    });

    final httpResponse =
        await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));

    if (httpResponse.statusCode == 200) {
      return setState(() {
        norrisData = NorrisData.fromJson(jsonDecode(httpResponse.body));
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
}
