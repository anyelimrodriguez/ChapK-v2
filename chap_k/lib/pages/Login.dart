import 'package:chap_k/pages/WelcomePage.dart';
import "package:flutter/material.dart";
// import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC3B1E1),
      body: Center(
        child: SafeArea(
          // child: SingleChildScrollView(

          child: Container(
            alignment: Alignment.center,
            // padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.black)),
            height: MediaQuery.of(context).size.height,
            width: 500,
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
                        // Text(
                        //   "Create an Account,Its free",
                        //   style: TextStyle(
                        //     fontSize: 15,
                        //     color: Colors.grey[700],
                        //   ),
                        // ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          makeInput(label: "Email"),
                          makeInput(label: "Password", obsureText: false),
                          // makeInput(label: "Confirm Pasword", obsureText: true)
                        ],
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
                          onPressed: () {},
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
                          '../../imgs/logo.png',
                          fit: BoxFit.contain,
                          height: 200,
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
        ),
      ),
    );
  }
}

Widget makeInput({label, obsureText = true}) {
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
      TextField(
        // obscureText: obsureText,
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
