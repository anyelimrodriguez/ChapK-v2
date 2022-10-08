import 'package:chap_k/pages/auth.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';

/*
  Color palette: Honeydew -> Color(0xFFF1FFE7)
  Color palette: Wisteria(the purple) -> Color(0xFFC3B1E1)
  Color palette: Space Cadet (dark) -> Color(0xFF1A1B41)
*/

class SignUp extends StatefulWidget {
  // const SignUp({super.key});
  final toggleView;
  SignUp({this.toggleView});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // These variables are for the input fields
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  // void _showHomePage() {
  //   Navigator.of(context).pushNamed('/Home');
  // }

  String error = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool screenIsWideEnough = screenWidth > 1000;

    void showLogInPage() {
      Navigator.of(context).pushNamed('/Login');
    }

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
                direction: screenIsWideEnough ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, screenHeight / 12, 15, 0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('CHAP-K',
                            style: TextStyle(
                              color: Color(0xFF1A1B41),
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            )),
                        Image.asset(
                          'imgs/SignUpPageReading.png',
                          //fit: BoxFit.contain,
                          width: screenHeight / 2,
                          height: screenHeight / 2,
                        ),
                        const Text(
                            'Connect with stories from around the world. ',
                            style: TextStyle(
                              color: Color(0xFF1A1B41),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth / 20, 0, 15, 0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, screenHeight / 12, 0,
                              screenHeight / 20), //50 20
                          child: Text('Create a new account.',
                              style: TextStyle(
                                color: Color(0xFF1A1B41),
                                //fontFamily: 'Inter',
                                fontSize:
                                    screenWidth > 900 && screenWidth < 1100
                                        ? 40
                                        : 48,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, 0, 0, screenHeight / 20), //0 0 0 15
                          child: Flex(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: ,
                            mainAxisAlignment: MainAxisAlignment.center,
                            direction: screenWidth > 330
                                ? Axis.horizontal
                                : Axis.vertical,
                            children: [
                              const Text('Already a member?',
                                  style: TextStyle(
                                    color: Color(0xFF1A1B41),
                                    fontSize: 24,
                                  )),
                              TextButton(
                                onPressed: showLogInPage,
                                child: const Text('Sign In',
                                    style: TextStyle(
                                      color: Color(0xFF1A1B41),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Card(
                              color: const Color(0xFFD9D9D9),
                              // child: SignUpForm(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                                        const EdgeInsets.fromLTRB(8, 8, 8, 20),
                                    child: TextFormField(
                                      obscureText: true,
                                      controller: _passwordTextController,
                                      decoration: InputDecoration(
                                        hintText: 'Create your password',
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
                                          try {
                                            final credential = await FirebaseAuth
                                                .instance
                                                .createUserWithEmailAndPassword(
                                              email: _emailTextController.text,
                                              password:
                                                  _passwordTextController.text,
                                            );
                                            Navigator.of(context)
                                                .pushNamed('/Home');
                                          } on FirebaseAuthException catch (e) {
                                            String errorMessage = "";
                                            if (e.code == 'weak-password') {
                                              errorMessage =
                                                  "The password provided is too weak.";
                                              //print('The password provided is too weak.');
                                            } else if (e.code ==
                                                'email-already-in-use') {
                                              errorMessage =
                                                  "An account already exists for that email.";
                                              //print('An account already exists for that email.');
                                            } else if (e.code ==
                                                'invalid-email') {
                                              errorMessage =
                                                  "The email provided is invalid.";
                                              //print('Please enter a valid email');
                                            } else {
                                              errorMessage =
                                                  "Something is wrong.";
                                            }
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                action: SnackBarAction(
                                                  textColor: Color(0xFFC3B1E1),
                                                  label:
                                                      '${e.code == 'email-already-in-use' ? "Login" : "Try again"}',
                                                  onPressed: () {
                                                    // Code to execute.
                                                    if (e.code ==
                                                        'email-already-in-use') {
                                                      showLogInPage();
                                                    }
                                                    //otherwise don't do anything
                                                  },
                                                ),
                                                content: Text(errorMessage),
                                                duration:
                                                    const Duration(seconds: 7),
                                                width:
                                                    400, // Width of the SnackBar.
                                                //margin: EdgeInsets.fromLTRB(300, 100, 300, 100),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal:
                                                      8.0, // Inner padding for SnackBar content.
                                                ),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                //backgroundColor: Colors.white, //Color(0xFFC3B1E1),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            );
                                          } catch (e) {
                                            //print(e);
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
                                        child: const Text('Create Account',
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
                ],
              ),
            ),
          );
        }));
  }
}



// //This creates a widget for the sign up form
// class SignUpForm extends StatefulWidget {
//   const SignUpForm({super.key});

//   @override
//   State<SignUpForm> createState() => _SignUpFormState();
// }

// //This class holds the data for form created
// class _SignUpFormState extends State<SignUpForm> {
//   final _formKey = GlobalKey<FormState>(); //used for input validation

//   //These variables are for the input fields
//   final _emailTextController = TextEditingController();
//   final _passwordTextController = TextEditingController();

//   void _showHomePage() {
//     Navigator.of(context).pushNamed('/Home');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//                 controller: _emailTextController,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: 'Enter your email address',
//                   hintStyle: TextStyle(color: Colors.grey[350]),
//                   labelText: 'Email',
//                   labelStyle: const TextStyle(
//                     color: Color(0xFFC3B1E1),
//                   ),
//                   border: InputBorder.none,
//                 ),
//                 validator: (String? val) {
//               if (val!.isEmpty) {
//                 return "Please Enter an Email";
//               }
//               return null;
//             },
//             onChanged: (val) {
//               setState(() => email = val);
//                 }),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
//             child: TextFormField(
//                 obscureText: true,
//                 controller: _passwordTextController,
//                 decoration: InputDecoration(
//                   hintText: 'Create your password',
//                   hintStyle: TextStyle(color: Colors.grey[350]),
//                   labelText: 'Password',
//                   labelStyle: const TextStyle(
//                     color: Color(0xFFC3B1E1),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: InputBorder.none,
//                 ),
//                 validator: (password) {
//                   if (password == null || password.length < 6) {
//                     return 'Please set a password longer than six characters';
//                   }
//                   return null;
//                 }),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
//             child: SizedBox(
//               height: 50, //screenHeight/15,
//               width: 300, //screenWidth/4,
//               child: TextButton(
//                 onPressed: () {
//                   //If email and password are both valid, continue, if not, display error
//                   if (_formKey.currentState!.validate()) {
//                     _showHomePage();
//                   }
//                 },
//                 style: ButtonStyle(
//                   foregroundColor: MaterialStateProperty.resolveWith(
//                       (Set<MaterialState> states) {
//                     return states.contains(MaterialState.disabled)
//                         ? null
//                         : Colors.white;
//                   }),
//                   backgroundColor: MaterialStateProperty.resolveWith(
//                       (Set<MaterialState> states) {
//                     return states.contains(MaterialState.disabled)
//                         ? null
//                         : const Color(0xFFE1B1B1);
//                   }),
//                 ),
//                 child: const Text('Create Account',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     )),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
