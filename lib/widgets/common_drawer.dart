import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feed/widgets/about_tile.dart';
import 'package:flutter_feed/fblogin/auth.dart';
import 'package:flutter_feed/ui_data.dart';

class CommonDrawer extends StatefulWidget {
  CommonDrawer({Key? key, this.auth, this.onSignedOut}) : super(key: key);

  final AuthImpl? auth;
  final VoidCallback? onSignedOut;

  @override
  State<StatefulWidget> createState() => _CommonDrawer();
}

class _CommonDrawer extends State<CommonDrawer> {
  late User firebaseUser;

  @override
  void initState() {
    widget.auth!.getCurrentUser().then((user) {
      setState(() {
        firebaseUser = (user?.uid == null ? null : user)!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              firebaseUser.displayName.toString(),
            ),
            accountEmail: Text(
              firebaseUser.email.toString(),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(UIData.pkImage),
            ),
          ),
          ListTile(
            title: Text(
              "Profile",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.black.withOpacity(0.7)),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              "Shopping",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.black.withOpacity(0.7)),
            ),
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.green,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            title: Text(
              "Dashboard",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.black.withOpacity(0.7)),
            ),
            leading: Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
          ),
          ListTile(
            title: Text(
              "Timeline",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.black.withOpacity(0.7)),
            ),
            leading: Icon(
              Icons.timeline,
              color: Colors.cyan,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.black.withOpacity(0.7)),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.brown,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            onTap: _signOut,
            title: Text(
              "Logout",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.black.withOpacity(0.7)),
            ),
            leading: Icon(
              Icons.lock,
              color: Colors.brown,
            ),
          ),
          Divider(),
          MyAboutTile()
        ],
      ),
    );
  }

  void _signOut() async {
    try {
      await widget.auth!.signOut();
      return widget.onSignedOut!();
//      Navigator.popAndPushNamed(context, UIData.loginRoute);
    } catch (e) {
      print(e);
    }
  }
}
