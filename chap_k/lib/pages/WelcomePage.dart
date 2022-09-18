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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Logo(),
          SizedBox(width: 20.0),
          LoginInButton(),
            
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
                  SizedBox(height: 30.0,width: 10.0),
                  Text(
                    "Logo Here",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 30.0,width: 10.0),

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
                   SizedBox(height: 30.0,width: 10.0),
                  Text(
                    "Login In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0,width: 10.0),
                ],
              ),
              onPressed: () {},
              style: TextButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Color(0xFFCCCCCC),
              ),
          );
  }
}