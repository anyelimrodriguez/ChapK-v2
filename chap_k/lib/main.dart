// Importing the designs and packages needed for the project
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:chap_k/pages/WelcomePage.dart';
import 'package:chap_k/pages/Login.dart';
import 'package:chap_k/pages/SignUp.dart';
import 'package:chap_k/pages/Home.dart';
import 'package:chap_k/pages/Write.dart';
import 'package:chap_k/pages/ViewStory.dart';

// Main is the point of execution ( have runApp() function in the main)
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyB9QVUVRFxJc3tYRMWf0bXAuwpty42ZdgQ",
          appId: "1:77260781034:web:839306bb68dcf1f9e3ee93",
          messagingSenderId: "77260781034",
          projectId: "chap-k"));
  // Chap_k is the root widget, the mother/father of all the widgets of our app
  runApp(Chap_K());
}

class Chap_K extends StatelessWidget {
  const Chap_K({super.key});

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
      },
    );
  }
}
