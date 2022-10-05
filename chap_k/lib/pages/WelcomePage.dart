// The Welcome Page I need to make it more responsive 
import 'package:flutter/material.dart';

// Setting the Global Variables for the Window Height and Width
double windowHeight=0;
double windowWidth=0;

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
     // Adding the height and width to the Window Dimensions
    windowHeight=MediaQuery.of(context).size.height;
    windowWidth=MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: Color(0xFFC3B1E1),
      body: Column(                                                          // MAIN COLUMN of the whole Welcome Page -----------
        children: <Widget>[
          Row(                                                               // FIRST ROW LOGO and LOGIN BUTTON 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Logo(),
              LoginInButton(),
            ]
          ),
          SizedBox(height: windowHeight/25, width: 100.0),
          Row (                                                        // We are Chap-K row-----------------------------------                    
            children: [
              SizedBox(width: windowWidth/15, height: 50.0),
              Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/8,
                child: FittedBox(
                  child: Text(
                    "Hi, we're CHAP-K",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
            ],
          ),
          SizedBox(height: windowHeight/30, width: 50.0),
          Row ( 
            mainAxisAlignment: MainAxisAlignment.center,                                      // Post and Connect With People from many places-----------------------------------                    
            children: [
              Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/14,
                child: FittedBox(
                  child: Text(
                    "Post and Connect with People from many Places",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: windowHeight/30, width: 50.0),
          Row ( 
            mainAxisAlignment: MainAxisAlignment.center,                                      // Write your chap today K-----------------------------------                    
            children: [
              Container(
                width: MediaQuery.of(context).size.width/5,
                height: MediaQuery.of(context).size.height/15,
                child: FittedBox(
                  child: Text(
                    "Write your chapter today, K ?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: windowHeight/30, width: 50.0),
          Row(
            children: <Widget> [
              Image.asset( 
                'assets/imgs/welcomepage.png',
                fit: BoxFit.contain,
                height: windowHeight/3,
                width: windowWidth/2,
              ),
              GetStartedButton(),
            ]
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
      //color: Colors.green,
      padding: EdgeInsets.fromLTRB(windowWidth/22, windowHeight/22, 0, 0),
      child: Card(
        color: Color(0xFFFFBA01),
        child: Image.asset(
          'assets/imgs/logo.png',
          fit: BoxFit.contain,
          height: windowHeight/10,
          width: windowWidth/10,
        ),
      ),
    );
  }
}


// The Login in Widget Button  ------------------------------------------------------------------
class LoginInButton extends StatelessWidget {
  const LoginInButton({super.key});
  @override
  Widget build(BuildContext context) {
    //print(windowHeight);
    //print(windowWidth);
    return Container(
      //color: Colors.green,
      padding: EdgeInsets.fromLTRB(0, windowHeight/22, windowWidth/22, 0),
      child: SizedBox (
        height: windowHeight/10,
        width: windowWidth/10,
        child: TextButton(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width/20,
            height: MediaQuery.of(context).size.height/20,
            child: FittedBox(
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ],
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/Login');
          },
          style: TextButton.styleFrom(
            elevation: 0,
              backgroundColor: Color(0xFFFFBA01),  //0xFFCCCCCC
          ),

        ),
      ),
    );
  }
}

// GetStarted Button --------------------------------------------------------------------------
class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: windowHeight/5,
      width: windowWidth/3,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/SignUp');
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
    
              ),  
          ) 
        ), 
        child: Container(
            width: MediaQuery.of(context).size.width/10,
            height: MediaQuery.of(context).size.height/10,
            child: FittedBox(
              child: Text(
                "Get Started",
                style: TextStyle(
                  color: Color(0xFFC3B1E1),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ),
    );
  }
}
