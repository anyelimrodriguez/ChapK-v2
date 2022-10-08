import 'package:chap_k/pages/Home.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

/*
  Color palette: Honeydew -> Color(0xFFF1FFE7)
  Color palette: Wisteria(the purple) -> Color(0xFFC3B1E1)
  Color palette: Space Cadet (dark) -> Color(0xFF1A1B41)
*/

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

  // These variables are for the input fields
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    //bool screenIsWideEnough = screenWidth > 1000;

    void showSignUpPage() {
      Navigator.of(context).pushNamed('/SignUp');
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF1FFE7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Flex(
                    // FIRST ROW LOGO and LOGIN BUTTON
                    direction:screenWidth>250?Axis.horizontal:Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Logo(),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: LoginInButton(),
                    ),
                  ]),
                ),
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 300,
                    maxWidth: 500,
                  ),
                  child:Center(
                    child: Card(
                      color: const Color(0xFFD9D9D9),
                      // child: SignUpForm(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                            child: Text("Welcome Back!",
                            style: TextStyle(
                              color: const Color(0xFF1A1B41),
                              fontSize: screenWidth>450?48:36,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom:20),
                            child: Flex(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: ,
                              mainAxisAlignment: MainAxisAlignment.center,
                              direction: screenWidth > 430
                                  ? Axis.horizontal
                                  : Axis.vertical,
                              children: [
                                const Text("Don't have an account?",
                                    style: TextStyle(
                                      color: Color(0xFF1A1B41),
                                      fontSize: 24,
                                    )),
                                TextButton(
                                  onPressed: showSignUpPage,
                                  child: const Text('Sign Up',
                                      style: TextStyle(
                                        color: Color(0xFF1A1B41),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                            child: TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter your email address',
                                hintStyle:
                                    TextStyle(color: Colors.grey[350]),
                                labelText: 'Email',
                                labelStyle: const TextStyle(
                                  color: Color(0xFFC3B1E1),
                                ),
                                border: InputBorder.none,
                              ),
                              // validator: (String? val) {
                              //   if (val!.isEmpty) {
                              //     return "Please Enter an Email";
                              //   }
                              //   return null;
                              // },
                              // onChanged: (val) {
                              //   setState(() => email = val);
                              // }
                            ),
                          ),
                          Padding(
                            padding:
                              const EdgeInsets.fromLTRB(30, 8, 30, 20),
                            child: TextFormField(
                              obscureText: true,
                              controller: _passwordTextController,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                hintStyle:
                                    TextStyle(color: Colors.grey[350]),
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                  color: Color(0xFFC3B1E1),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                              // validator: (password) {
                              //   if (password == null ||
                              //       password.length < 6) {
                              //     return 'Please set a password longer than six characters';
                              //   }
                              //   return null;
                              // },
                              // onChanged: (val) {
                              //   setState(() => password = val);
                              // }
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8, 8, 8, 20),
                            child: SizedBox(
                              height: 50, //screenHeight/15,
                              width: 300, //screenWidth/4,
                              child: TextButton(
                                onPressed: () async {
                                  try{
                                    final credential = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: _emailTextController.text,
                                          password: _passwordTextController.text);
                                    Navigator.of(context)
                                      .pushNamed('/Home');
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
                                }
                                /*async {
                                final Credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                        email: _emailTextController.text,
                                        password: _passwordTextController.text)
                                    .then((value) {
                                  print("Created Account");
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Home()));
                                }).onError((error, stackTrace) {
                                  
                                  print(
                                      "Error ${error.toString()}");
                                  
                                });
                              }*/
                                ,
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (Set<MaterialState> states) {
                                    return states.contains(
                                            MaterialState.disabled)
                                        ? null
                                        : Colors.white;
                                  }),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (Set<MaterialState> states) {
                                    return states.contains(
                                            MaterialState.disabled)
                                        ? null
                                        : const Color(0xFFC3B1E1);
                                  }),
                                ),
                                child: const Text('Sign In',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
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
          Navigator.pushNamed(context, '/SignUp');
        },
        style: TextButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xFF1A1B41), //0xFFCCCCCC
        ),
        child: const Text(
          "Sign Up",
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

// The Logo Widget
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return /*Container(
      //color: Colors.green,
      child: */Card(
        color: const Color(0xFF1A1B41),
        child: Image.asset(
          'imgs/logo.png',
          fit: BoxFit.contain,
          height: 50,
          width: 50,
        ),
      );
    //);
  }
}




  /*_inputFields(context) {
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
}*/
