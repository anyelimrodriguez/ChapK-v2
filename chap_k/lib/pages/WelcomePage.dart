import 'package:flutter/material.dart';
/*
  Color palette: Honeydew -> Color(0xFFF1FFE7)
  Color palette: Wisteria(the purple) -> Color(0xFFC3B1E1)
  Color palette: Space Cadet (dark) -> Color(0xFF1A1B41)
*/
// Setting the Global Variables for the Window Height and Width
double windowHeight = 0;
double windowWidth = 0;

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    // Adding the height and width to the Window Dimensions
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool screenIsWideEnough = screenWidth > 1000;

    return Scaffold(
      backgroundColor: const Color(0xFFF1FFE7),
      body: LayoutBuilder(builder:
          (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: viewportConstraints.maxWidth,
                //minHeight: viewportConstraints.maxHeight,
            ),
          child: Flex(
            direction: Axis.vertical,//screenIsWideEnough ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flex(
                // FIRST ROW LOGO and LOGIN BUTTON
                direction:screenWidth>200?Axis.horizontal:Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Logo(),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: LoginInButton(),
                  ),
              ]),
              //SizedBox(height: windowHeight / 25, width: 100.0),
              Padding(
                padding: EdgeInsets.fromLTRB(10, screenHeight / 12, 15, 30),
                child: RichText(
                  text: const TextSpan(
                  text: "Hi, we're ",
                  style: TextStyle(
                      color: Color(0xFF1A1B41),
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:'CHAP-K.',
                      style: TextStyle(
                      color: Color(0xFFC3B1E1),
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,)
                    )
                  ]
                  )),
              ),
               //),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 25, 40),
                child: Text(
                "Post and connect with people around the world",
                style: TextStyle(
                  color: Color(0xFF1A1B41),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom:10.0),
                child: Text(
                  "Write your chapter today, K?",
                  style: TextStyle(
                    color: Color(0xFF1A1B41),
                    fontSize: 20.0,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //SizedBox(height: windowHeight / 30, width: 50.0),
              /*Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Post and Connect With People from many places-----------------------------------
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 14,
                    child: const FittedBox(
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
              ),*/
              //SizedBox(height: windowHeight / 30, width: 50.0),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.center, // Write your chap today K-----------------------------------
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom:10.0),
                    child: Text(
                      "Write your chapter today, K?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),*/
             //SizedBox(height: windowHeight / 30, width: 50.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Flex(
                  direction: screenIsWideEnough ? Axis.horizontal : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  Image.asset(
                    'imgs/welcomepage.png',
                    //fit: BoxFit.contain,
                    height: screenHeight/2,//windowHeight / 3,
                    width: screenWidth/2,//windowWidth / 2,
                  ),
                  const GetStartedButton(),
                ]),
              ),
            ],
          ),
        ),
      );
    }));  
  }
}

// The Logo Widget
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      padding: EdgeInsets.fromLTRB(windowWidth / 22, windowHeight / 22, 0, 0),
      child: Card(
        color: const Color(0xFF1A1B41),
        child: Image.asset(
          'imgs/logo.png',
          fit: BoxFit.contain,
          height: windowHeight / 10,
          width: windowWidth / 10,
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
    return SizedBox(
      height: 50,
      width: 100,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/Login');
        },
        style: TextButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xFF1A1B41), //0xFFCCCCCC
        ),
        child: const Text(
          "Login",
          style: TextStyle(
            color: Color(0xFFF1FFE7),
            fontSize: 20,
            fontWeight: FontWeight.bold,
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
      height: 50,
      width: 300,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/SignUp');
        },
        style: ButtonStyle(
            //elevation: MaterialStateProperty.all<double>(0),
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF1A1B41)),
            /*shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            )*/),
        child: const Text(
          "Get Started",
          style: TextStyle(
            color: Color(0xFFF1FFE7),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    );
  }
}
