// Importing the designs and packages needed for the project
import "package:flutter/material.dart";
import 'package:chap_k/pages/WelcomePage.dart';

// Main is the point of execution ( have runApp() function in the main)
void main() {
  // Chap_k is the root widget, the mother/father of all the widgets of our app
  runApp(Chap_K());
}

class Chap_K extends StatelessWidget {
  const Chap_K({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}