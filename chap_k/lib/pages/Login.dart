import 'dart:html';

import 'package:chap_k/pages/Home.dart';
import 'package:chap_k/pages/WelcomePage.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class Login extends StatefulWidget {
  // const Login({super.key});
  final toggleView;
  Login({this.toggleView});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool screenIsWideEnough = screenWidth > 1000;

    return Scaffold(
      backgroundColor: Color(0xFFC3B1E1),
      body: Center(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // child: SingleChildScrollView(

              Container(
                constraints: BoxConstraints(maxWidth: 500, minHeight: 470),

                alignment: Alignment.center,
                // padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.black)),
                height: screenHeight,
                width: screenWidth / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: [_inputFields(context)],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            padding: EdgeInsets.only(top: 3, left: 3),
                            child: MaterialButton(
                              hoverColor: Colors.amber,
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () async {
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                } on FirebaseAuthException catch (e) {
                                  String errorMessage = "";
                                  if (e.code == 'invalid-email') {
                                    errorMessage =
                                        "The email entered is invalid.";
                                    print('Email invalid');
                                  } else if (e.code == 'user-disabled') {
                                    errorMessage =
                                        "Your account has been disabled.";
                                    print('User disabled');
                                  } else if (e.code == 'user-not-found') {
                                    errorMessage =
                                        "No account has been found for this email.";
                                    print('User not found');
                                  } else if (e.code == 'wrong-password') {
                                    errorMessage =
                                        "You entered the wrong password.";
                                    print('Wrong Password');
                                  } else {
                                    errorMessage = "Something is wrong.";
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      action: SnackBarAction(
                                        textColor: Color(0xFFC3B1E1),
                                        label:
                                            '${e.code == 'user-not-found' ? "Sign Up" : "Try again"}',
                                        onPressed: () {
                                          // Code to execute.
                                          if (e.code == 'user-not-found') {
                                            Navigator.of(context)
                                                .pushNamed('/SignUp');
                                          }
                                          //otherwise don't do anything
                                        },
                                      ),
                                      content: Text(errorMessage),
                                      duration: const Duration(seconds: 15),
                                      width: 400, // Width of the SnackBar.
                                      //margin: EdgeInsets.fromLTRB(300, 100, 300, 100),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            8.0, // Inner padding for SnackBar content.
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      //backgroundColor: Colors.white, //Color(0xFFC3B1E1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  );
                                } catch (e) {
                                  print(e);
                                }
                              },
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFFC3B1E1)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account? "),
                            // Text(
                            //   "Sign Up",
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.w600, fontSize: 18),
                            // ),
                          ],
                        ),

                        //------------

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SignupButton(),
                          ],
                        ),

                        //-------------

                        //Added Logo
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // SizedBox(height: 10.0, width: 10.0),
                            Image.asset(
                              '../../imgs/HomeLogo.png',
                              fit: BoxFit.contain,
                              height: screenHeight / 6,
                              width: 200,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  _inputFields(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: "Email Address",
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.email_outlined),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          ),
        ),
        SizedBox(
          height: 30,
        ),

        //Password

        SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: true,
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.password_outlined),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}

Widget makeInput({label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        ),
      ),
      SizedBox(
        height: 30,
      )
    ],
  );
}

// The Sign up in Widget Button
class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0, width: 10.0),
          Text(
            "Signup",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0, width: 20.0),
        ],
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/SignUp');
      },
      style: TextButton.styleFrom(
        elevation: 0,
        // backgroundColor: Color(0xFFFFBA01), //0xFFCCCCCC
      ),
    );
  }
}
