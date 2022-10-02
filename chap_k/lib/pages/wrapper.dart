import 'package:chap_k/pages/Home.dart';
import 'package:chap_k/pages/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<myusers?>(context);
    // print(user);

    //return home or authenticade widget
    // return Authenticate();

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
