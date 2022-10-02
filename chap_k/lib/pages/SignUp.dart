import 'dart:html';

import 'package:chap_k/pages/auth.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';

import 'Home.dart';

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
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void showLogInPage() {
      Navigator.of(context).pushNamed('/Login');
    }

    return Scaffold(
        backgroundColor: const Color(0xFFC3B1E1),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: viewportConstraints.maxWidth,
                //minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, screenHeight / 10,
                                  0, screenHeight / 20), //50 20
                              child: const Text('Create a new account.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    //fontFamily: 'Inter',
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, 0, 0, screenHeight / 20), //0 0 0 15
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Already a member?',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      )),
                                  TextButton(
                                    // onPressed: () async {
                                    // final Credential = await FirebaseAuth
                                    //     .instance
                                    //     .createUserWithEmailAndPassword(
                                    //         email: _emailTextController.text,
                                    //         password:
                                    //             _passwordTextController.text)
                                    //     .then((value) {
                                    //   print("Created Account");
                                    //   Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //           builder: (context) => Home()));
                                    // }).onError((error, stackTrace) {
                                    //   print("Error ${error.toString()}");
                                    // });
                                    // if (_formKey.currentState!.validate()) {
                                    //   Home();
                                    //   dynamic result = await _auth
                                    //       .signUpWithEmailAndPassword(
                                    //           email, password);
                                    //   if (result == null) {
                                    //     setState(() => error =
                                    //         'Log In Failed, Please try Again');
                                    //   }
                                    // }
                                    // },
                                    // onPressed: showLogInPage,
                                    onPressed: showLogInPage,
                                    child: const Text('Sign In',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 400,
                              child: Card(
                                color: Color(0xFFD9D9D9),
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
                                          hintStyle: TextStyle(
                                              color: Colors.grey[350]),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 8, 8, 20),
                                      child: TextFormField(
                                        obscureText: true,
                                        controller: _passwordTextController,
                                        decoration: InputDecoration(
                                          hintText: 'Create your password',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[350]),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 8, 8, 20),
                                      child: SizedBox(
                                        height: 50, //screenHeight/15,
                                        width: 300, //screenWidth/4,
                                        child: TextButton(
                                          onPressed: () async {
                                            final Credential = await FirebaseAuth
                                                .instance
                                                .createUserWithEmailAndPassword(
                                                    email: _emailTextController
                                                        .text,
                                                    password:
                                                        _passwordTextController
                                                            .text)
                                                .then((value) {
                                              print("Created Account");
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Home()));
                                            }).onError((error, stackTrace) {
                                              print(
                                                  "Error ${error.toString()}");
                                            });
                                          },
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty
                                                    .resolveWith(
                                                        (Set<MaterialState>
                                                            states) {
                                              return states.contains(
                                                      MaterialState.disabled)
                                                  ? null
                                                  : Colors.white;
                                            }),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith(
                                                        (Set<MaterialState>
                                                            states) {
                                              return states.contains(
                                                      MaterialState.disabled)
                                                  ? null
                                                  : const Color(0xFFE1B1B1);
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
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 8, 8, 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text('OR',
                                              style: TextStyle(
                                                  color: Color(0xFF9A9A9A)))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 0, 8, 20),
                                      child: SizedBox(
                                        height: 50,
                                        width: 300,
                                        child: TextButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty
                                                    .resolveWith(
                                                        (Set<MaterialState>
                                                            states) {
                                              return states.contains(
                                                      MaterialState.disabled)
                                                  ? null
                                                  : Colors.white;
                                            }),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith(
                                                        (Set<MaterialState>
                                                            states) {
                                              return states.contains(
                                                      MaterialState.disabled)
                                                  ? null
                                                  : const Color(0xFFE1CEB1);
                                            }),
                                          ),
                                          child:
                                              const Text('Connect with Google',
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
                            )
                          ],
                        )),
                    Expanded(
                      flex: 2,
                      child: Container(
                          color: const Color(0xFFC3B1E1),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 50, 15, 0),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('CHAP-K',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Image.asset(
                                  '../../imgs/SignUpPageReading.png',
                                  fit: BoxFit.contain,
                                ),
                                const Text(
                                    'Connect with stories from around the world. ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          )),
                    )
                  ],
                ),
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
//           Padding(
//             padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Text('OR', style: TextStyle(color: Color(0xFF9A9A9A)))
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(8, 0, 8, 20),
//             child: SizedBox(
//               height: 50,
//               width: 300,
//               child: TextButton(
//                 onPressed: () {},
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
//                         : const Color(0xFFE1CEB1);
//                   }),
//                 ),
//                 child: const Text('Connect with Google',
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
