import "package:flutter/material.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC3B1E1),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: Text('Create a new account.',
                    style: TextStyle(
                      color: Colors.white,
                      //fontFamily: 'Inter',
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a member?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      )
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ],
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: 400,
                  child: Card(
                    child: const SignUpForm(),
                    color: Color(0xFFD9D9D9),
                  ),
                )
              ],
            )
            
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFFC3B1E1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('CHAP-K',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Image.asset(
                    '../../imgs/SignUpPageReading.png',
                    fit: BoxFit.contain,
                    height: 350,
                    width: 350,
                  ),
                  Text('Connect with stories from around the world. ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ],
              )
            ),
          )
        ],)
    );
  }
}
//This creates a widget for the sign up form 
class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}
//This class holds the data for form created
class _SignUpFormState extends State<SignUpForm> {
  
  final _formKey = GlobalKey<FormState>(); //used for input validation 

  //These variables are for the input fields
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  void _showHomePage() {
    Navigator.of(context).pushNamed('/Home');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /*Text('Email Address',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 0.5, 
            )
          ),*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _emailTextController,
              decoration: const InputDecoration(hintText:'Enter your email address'),
            ),
          ),
          /*Text('Password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 0.5, 
            )
          ),*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordTextController,
              decoration: const InputDecoration(hintText:'Create your password'),
            ),
          ),
          SizedBox(
            height: 15
          ),
          TextButton(
            child: Text(
              'Create Account',
              style:TextStyle(
                fontWeight: FontWeight.bold,
              )
            ),
            onPressed: _showHomePage,
            style: ButtonStyle(

              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Color(0xFFE1B1B1);
              }),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('OR')
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            child: Text(
              'Connect with Google',
              style:TextStyle(
                fontWeight: FontWeight.bold,
              )
            ),
            onPressed: (){},
            style: ButtonStyle(

              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.blue;
              }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}