import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:mother_and_me/screens/homeScreen.dart';
import 'package:mother_and_me/screens/registerationPage.dart';
import 'package:mother_and_me/screens/splashScreen.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:mother_and_me/components/inputComponent.dart';
import 'package:mother_and_me/components/loginRegisterLayout.dart';

import '../api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return LoginRegisterLayout(
      redirectingPage: LoginDetails(),
      leadingTop: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )
      ),
    );
  }
}

class LoginDetails extends StatefulWidget {
  const LoginDetails({Key? key}) : super(key: key);

  @override
  State<LoginDetails> createState() => _LoginDetailsState();
}

class _LoginDetailsState extends State<LoginDetails> {

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Text(
              "LOGIN",
              style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 5,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputComponent(
                    inputIcon: Icons.email,
                    inputHintText: "Enter your Email Address",
                    inputTextEditingController: _email
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: InputComponent(
                      inputIcon: Icons.lock,
                      inputHintText: "Enter your Password",
                      inputTextEditingController: _password
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 300,
            margin: const EdgeInsets.only(top: 60),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(82,128,198,1)),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    )
                ),
                onPressed: () {
                  print(_email.text+" "+_password.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                )
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "New to the app? ",
                    style: TextStyle(fontSize: 20)
                ),
                InkWell(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Color.fromRGBO(7,136,254,1),
                        fontSize: 20
                    ),
                  ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterationPage())),
                ),
                Text(
                  " now.",
                  style: TextStyle(
                      fontSize: 20
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
