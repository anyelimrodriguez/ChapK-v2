import 'package:flutter/material.dart';
import 'Login.dart';
import 'SignUp.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogin = true;
  toggleView() {
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return Login(toggleView: toggleView);
    } else {
      return SignUp(toggleView: toggleView);
    }
  }
}
