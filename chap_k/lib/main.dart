// Importing the designs and packages needed for the project
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:chap_k/pages/WelcomePage.dart';
import 'package:chap_k/pages/Login.dart';
import 'package:chap_k/pages/SignUp.dart';
import 'package:chap_k/pages/Home.dart';
import 'package:chap_k/pages/Write.dart';
import 'package:chap_k/pages/ViewStory.dart';
import 'package:chap_k/pages/Language.dart';

//Importing firebase configuration
import 'firebase_options.dart';

// Main is the point of execution ( have runApp() function in the main)
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web);
  // Chap_k is the root widget, the mother/father of all the widgets of our app
  runApp(const ChapK());
}

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(Chap_K());
// }

class ChapK extends StatelessWidget {
  const ChapK({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/SignUp': (context) => SignUp(),
        '/Login': (context) => Login(),
        '/Home': (context) => Home(),
        '/Write': (context) => Write(),
        '/ViewStory': (context) => ViewStory(),
        '/Language': (context) => Language(),
      },
    );
  }
}
