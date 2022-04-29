import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feed/fblogin/auth.dart';
import 'package:flutter_feed/widgets/common_dialogs.dart';
import 'package:flutter_feed/widgets/common_scaffold.dart';
import 'package:flutter_feed/widgets/profile_tile.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({ Key? key, required this.auth}) : super(key: key);
  final AuthImpl auth;

  @override
  State<StatefulWidget> createState() =>
       _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  Size? deviceSize;
  User? firebaseUser;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    getUser();
  }

  void getUser() async {
    try {
      firebaseUser = await widget.auth.getCurrentUser();
    } catch (e) {
      print(e);
    }
    if (firebaseUser != null) {
      setState(() {});
    }
  }

  Widget profileHeader() => Container(
        height: deviceSize!.height / 4,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.black,
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2013/07/18/20/24/brad-pitt-164880_960_720.jpg"),
                    ),
                  ),
                  Text(
                    "",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Text(
                    firebaseUser!.email!,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Widget imagesCard() => Container(
        height: deviceSize!.height / 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Photos",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                ),
              ),
              Expanded(
                child: Card(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            "https://cdn.pixabay.com/photo/2018/10/04/14/22/donut-3723751__340.jpg"
                              ),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget profileColumn() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2013/07/18/20/24/brad-pitt-164880_960_720.jpg"),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "posted a photo",
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "5 mins ago",
                  )
                ],
              ),
            ))
          ],
        ),
      );

  Widget postCard() => Container(
        width: double.infinity,
        height: deviceSize!.height / 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Post",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                ),
              ),
              profileColumn(),
              Expanded(
                child: Card(
                  elevation: 2.0,
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2018/10/31/22/42/surprised-3786845__340.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget bodyData() => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            profileHeader(),
            followColumn(deviceSize!),
            imagesCard(),
            postCard(),
            postCard(),
          ],
        ),
      );

  Widget followColumn(Size deviceSize) => Container(
        height: deviceSize.height * 0.13,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ProfileTile(
              title: "1.5K",
              subtitle: "Posts",
            ),
            ProfileTile(
              title: "2.5K",
              subtitle: "Followers",
            ),
            ProfileTile(
              title: "10K",
              subtitle: "Comments",
            ),
            ProfileTile(
              title: "1.2K",
              subtitle: "Following",
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return CommonScaffold(
      appTitle: "Profile",
      bodyData: bodyData(),
      elevation: 0.0,
    );
  }
}
