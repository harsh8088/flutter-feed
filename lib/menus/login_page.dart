import 'package:flutter/material.dart';
import 'package:flutter_feed/fblogin/auth.dart';
import 'package:flutter_feed/ui_data.dart';
import 'package:flutter_feed/widgets/common_dialogs.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});

  final AuthImpl? auth;
  final VoidCallback? onSignedIn;

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormMode { SIGNIN, SIGNUP }

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;
  FormMode _formMode = FormMode.SIGNIN;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        showProgress(context);
        if (_formMode == FormMode.SIGNIN) {
          String userId = await widget.auth!.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          String userId = await widget.auth!.signUp(_email, _password);
          print('Signed up user: $userId');
        }
        hideProgress(context);
        widget.onSignedIn!();
      } catch (e) {
        hideProgress(context);
        print('Error: $e');
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(e.toString()),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  void _signUp() {
    formKey.currentState!.reset();
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void _signIn() {
    formKey.currentState!.reset();
    setState(() {
      _formMode = FormMode.SIGNIN;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(
          height: 100.0,
        ),
        FlutterLogo(
          // colors: Colors.green,
          size: 80.0,
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          "Welcome to ${UIData.appName}",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          "Sign in to continue",
          style: TextStyle(color: Colors.grey),
        ),
        Container(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  // _sizedBox(50.0),
                  //  _logo(),
                  // _sizedBox(100.0),
                  _emailInput(),
                  _sizedBox(15.0),
                  _passwordInput(),
                  _sizedBox(30.0),
                  _submitButton(),
                  _label(),
                ],
              ),
            ))
      ],
    )));
  }

  Widget _sizedBox(_height) {
    return SizedBox(height: _height);
  }

  Widget _emailInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Email',
          icon: Icon(
            Icons.mail,
            color: Colors.grey,
          )),
      validator: (value) => value!.isEmpty ? 'Email can\'t be empty' : null,
      onSaved: (value) => _email = value!,
    );
  }

  Widget _passwordInput() {
    return TextFormField(
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Password',
          icon: Icon(
            Icons.lock,
            color: Colors.grey,
          )),
      validator: (value) => value!.isEmpty ? 'Password can\'t be empty' : null,
      onSaved: (value) => _password = value!,
    );
  }

  Widget _label() {
    if (_formMode == FormMode.SIGNIN) {
      return TextButton(
        child: Text('Create an account',
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 14.0,
                decoration: TextDecoration.underline)),
        onPressed: _signUp,
      );
    } else {
      return TextButton(
        child: Text('Have an account? Sign in',
            style: TextStyle(
              color: Colors.blueGrey,
              decoration: TextDecoration.underline,
            )),
        onPressed: _signIn,
      );
    }
  }

  Widget _submitButton() {
    if (_formMode == FormMode.SIGNIN) {
      return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Colors.blueAccent.shade100,
              elevation: 5.0,
              child: MaterialButton(
                minWidth: 200.0,
                height: 42.0,
                color: Colors.green,
                child: Text('Login',
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: validateAndSubmit,
              )));
    } else {
      return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Colors.lightBlueAccent.shade100,
              elevation: 5.0,
              child: MaterialButton(
                minWidth: 200.0,
                height: 42.0,
                color: Colors.green,
                child: Text('Create account',
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: validateAndSubmit,
              )));
    }
  }
}
