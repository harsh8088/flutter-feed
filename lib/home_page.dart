import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feed/fblogin/auth.dart';
import 'package:flutter_feed/logic/bloc/menu_bloc.dart';
import 'package:flutter_feed/model/menu.dart';
import 'package:flutter_feed/ui_data.dart';
import 'package:flutter_feed/widgets/about_tile.dart';
import 'package:flutter_feed/widgets/common_drawer.dart';
import 'package:flutter_feed/widgets/profile_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({ Key? key, required this.auth,  this.onSignedOut})
      : super(key: key);

  final AuthImpl auth;
  final VoidCallback? onSignedOut;

  @override
  State<StatefulWidget> createState() =>  _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> todoList = List.empty(growable: true);

  //String todo;
  Size? deviceSize;
  final _scaffoldState = GlobalKey<ScaffoldState>();

  BuildContext? _context;

  final FirebaseDatabase database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//  DatabaseReference databaseReference;

  @override
  void initState() {
    super.initState();
    //  todo = "";
    //  databaseReference = database.reference().child("todo");
    //  databaseReference.onChildAdded.listen(_onEntryAdded);
    //   databaseReference.onChildChanged.listen(_onEntryChanged);
  }

  //menuStack
  Widget menuStack(BuildContext context, Menu menu) => InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/${menu.items![0]}");
          //  _showModalBottomSheet(context, menu);
        },
        splashColor: Colors.orange,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              menuImage(menu),
              menuColor(),
              menuData(menu),
            ],
          ),
        ),
      );

  //stack 1/3
  Widget menuImage(Menu menu) => Image.asset(
        menu.image!,
        fit: BoxFit.cover,
      );

  //stack 2/3
  Widget menuColor() =>  Container(
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 5.0,
          ),
        ]),
      );

  //stack 3/3
  Widget menuData(Menu menu) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            menu.icon,
            color: Colors.white,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            menu.title!,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      );

  //appbar
  Widget appBar() => SliverAppBar(
        backgroundColor: Colors.black,
        pinned: true,
        elevation: 10.0,
        forceElevated: true,
        // expandedHeight: 150.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          background: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: UIData.kitGradients)),
          ),
          title: Row(
            children: <Widget>[
              FlutterLogo(
                // colors: Colors.yellow,
                textColor: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(UIData.appName),
            ],
          ),
        ),
      );

  //bodygrid
  Widget bodyGrid(List<Menu> menu) => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(_context!).orientation == Orientation.portrait
                  ? 2
                  : 3,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return menuStack(context, menu[index]);
        }, childCount: menu.length),
      );

  Widget homeScaffold(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
            // canvasColor: Colors.transparent,
            ),
        child: Scaffold(
            key: _scaffoldState,
            backgroundColor: Colors.yellow.withOpacity(0.2),
            drawer: CommonDrawer(auth: widget.auth, onSignedOut: _signOut),
            body: bodySliverList()),
      );

  Widget bodySliverList() {
    MenuBloc menuBloc = MenuBloc();
    return StreamBuilder<List<Menu>>(
        stream: menuBloc.menuItems,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? CustomScrollView(
                  slivers: <Widget>[
                    appBar(),
                    bodyGrid(snapshot.data!),
                  ],
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget header() => Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: UIData.kitGradients2)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileTile(
                  title: "Flutter Bottom Sheet",
                  subtitle: "description...",
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      );

  void _showModalBottomSheet(BuildContext context, Menu menu) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius:  BorderRadius.only(
                    topLeft:  Radius.circular(15.0),
                    topRight:  Radius.circular(15.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                header(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: menu.items!.length,
                    itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListTile(
                          title: Text(
                            menu.items![i],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, "/${menu.items![i]}");
                          }),
                    ),
                  ),
                ),
                MyAboutTile()
              ],
            )));
  }

  // void _onEntryChanged(Event event) {
  //   var oldEntry = todoList.singleWhere((entry) {
  //     //  return entry.key == event.snapshot.key;
  //   });

  //   setState(() {
  //     //   todoList[todoList.indexOf(oldEntry)] = Todo.fromSnapshot(event.snapshot);
  //   });
  // }

  // void _onEntryAdded(Event event) {
  //   setState(() {
  //     //  todoList.add(Todo.fromSnapshot(event.snapshot));
  //   });
  // }

  void _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut!();
    } catch (e) {
      print(e);
    }
  }

  void _writeData() {
    database.reference().child("message").set({"first": "David"});
  }

  void _readData() {
    setState(() {
      Completer<String> completer = new Completer<String>();
      DataSnapshot snapshot;
      database.reference().child("message").once().then((value) => {
            // snapshot = value.snapshot;
          });
      //     .then((DataSnapshot snapshot) async {
      //   Map<dynamic, dynamic> list = snapshot.value;
      //   print("Values from db is ${list.values}");
      // });
    });
  }

  void handleSubmit() {
    final FormState form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      form.reset();
      // databaseReference.push().set(todo.toJson());
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    deviceSize = MediaQuery.of(context).size;
    // return defaultTargetPlatform == TargetPlatform.iOS
    //     ? null
    //     : homeScaffold(context);
    return homeScaffold(context);
  }
}
