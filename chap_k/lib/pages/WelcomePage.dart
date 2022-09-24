import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC3B1E1),
      body: Column(
        // the main colum of the whole Welcome Page -----------------------
        children: [
          Row(
            // the first with the 2 buttons ----------------------------------
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Logo(),
              SizedBox(height: 100.0, width: 100.0),
              SizedBox(height: 100.0, width: 100.0),
              LoginInButton(),
            ],
          ),
          SizedBox(height: 25.0),
          Row(
            // We are Chap-K row-----------------------------------
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Hi, we're CHAP-K.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 55.0,
                ),
              ),
              SizedBox(height: 10.0, width: 20.0),
              SizedBox(height: 10.0, width: 20.0),
            ],
          ),
          SizedBox(height: 30.0),
          Row(
            // We are Post and Connect row-----------------------------------
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Post and Connect with People from many Places",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
              SizedBox(height: 10.0, width: 20.0),
            ],
          ),
          SizedBox(height: 25.0),
          Row(
            // Write your Chapter Today K?-----------------------------------
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Write your chapter today, K ?",
                style: TextStyle(
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(height: 10.0, width: 20.0),
              SizedBox(height: 10.0, width: 20.0),
            ],
          ),
          SizedBox(height: 50.0),
          Row(
            // Adding the Image and getstarted button here
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100.0, width: 200.0),
              Image.asset(
                '../../imgs/welcomepage.png',
                fit: BoxFit.contain,
                height: 350,
                width: 350,
              ),
              SizedBox(height: 100.0, width: 200.0),
              TextButton(
                // Get Started Button on right of image
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 150.0, width: 180.0),
                    Text(
                      "Get Started",
                      style: TextStyle(
                        color: Color(0xFFC3B1E1),
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 150.0, width: 180.0),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/SignUp');
                },

                style: TextButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// The Logo Widget
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Card(
        color: Color(0xFFCCCCCC),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 50.0, width: 20.0),
            Text(
              "Logo Here",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 50.0, width: 20.0),
          ],
        ),
      ),
    );
  }
}

// The Login in Widget Button
class LoginInButton extends StatelessWidget {
  const LoginInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 50.0, width: 20.0),
          Text(
            "Login In",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50.0, width: 20.0),
        ],
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/Login');
      },
      style: TextButton.styleFrom(
        elevation: 0,
        backgroundColor: Color(0xFFFFBA01), //0xFFCCCCCC
      ),
    );
  }
}
