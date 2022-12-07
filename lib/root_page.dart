
import 'package:flutter/material.dart';

import 'fblogin/auth.dart';
import 'home_page.dart';
import 'menus/login_page.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});

  final AuthImpl? auth;

  @override
  State<StatefulWidget> createState() => _RootPageState();
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_SIGNED_IN,
  SIGNED_IN,
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;

  @override
  void initState() {
    super.initState();
    widget.auth!.getCurrentUser().then((user) {
      setState(() {
        authStatus =
            user?.uid == null ? AuthStatus.NOT_SIGNED_IN : AuthStatus.SIGNED_IN;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.SIGNED_IN;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.NOT_SIGNED_IN;
    });
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
      //return _buildWaitingScreen();
      case AuthStatus.NOT_SIGNED_IN:
        return LoginPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.SIGNED_IN:
        return HomePage(
          auth: widget.auth!,
          onSignedOut: _signedOut,
        );
    }
  }
}
