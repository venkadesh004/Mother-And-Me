import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mother_and_me/components/constants.dart';
import 'package:mother_and_me/components/loginRegisterLayout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mother_and_me/components/inputComponent.dart';
import 'package:mother_and_me/screens/homeScreen.dart';
import 'package:mother_and_me/screens/loginPage.dart';
import 'package:mother_and_me/screens/splashScreen.dart';

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({Key? key}) : super(key: key);

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  @override
  Widget build(BuildContext context) {
    return LoginRegisterLayout(
      redirectingPage: RegisterationDetails(),
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

class RegisterationDetails extends StatefulWidget {
  const RegisterationDetails({Key? key}) : super(key: key);

  @override
  State<RegisterationDetails> createState() => _RegisterationDetailsState();
}

class _RegisterationDetailsState extends State<RegisterationDetails> {

  TextEditingController _email = new TextEditingController();
  TextEditingController _hosName = new TextEditingController();
  TextEditingController _fPrim = new TextEditingController();
  TextEditingController _phone = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Text(
              "REGISTER",
              style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 5,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: InputForRegisteration(email: _email, hosName: _hosName, fPrim: _fPrim, phone: _phone,),
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
                  if (_email.text != null) {
                    email = _email.text;
                  }
                  if (_hosName.text != null) {
                    hos = _hosName.text;
                  }
                  if (_fPrim.text != null) {
                    monthOfPrim = int.parse(_fPrim.text);
                  }
                  if (_phone.text != null) {
                    phone = _phone.text;
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  "Register",
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
                    "Already a User? ",
                    style: GoogleFonts.itim(
                        fontSize: 20
                    )
                ),
                InkWell(
                  child: Text(
                    "Login",
                    style: GoogleFonts.itim(
                        color: Color.fromRGBO(7,136,254,1),
                        fontSize: 20
                    ),
                  ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage())),
                ),
                Text(
                  " now.",
                  style: GoogleFonts.itim(
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

class InputForRegisteration extends StatefulWidget {
  const InputForRegisteration({Key? key,
    required this.email,
    required this.hosName,
    required this.fPrim,
    required this.phone
  }) : super(key: key);

  final email;
  final hosName;
  final fPrim;
  final phone;

  @override
  State<InputForRegisteration> createState() => _InputForRegisterationState();
}

class _InputForRegisterationState extends State<InputForRegisteration> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputComponent(
              inputIcon: Icons.email,
              inputHintText: "Enter your Email Address",
              inputTextEditingController: widget.email
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: InputComponent(
                inputIcon: Icons.local_hospital,
                inputHintText: "Enter your Hopital name",
                inputTextEditingController: widget.hosName
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: InputComponent(
                inputIcon: Icons.bedroom_baby,
                inputHintText: "Enter the month of First Primester",
                inputTextEditingController: widget.fPrim
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: InputComponent(
                inputIcon: Icons.phone,
                inputHintText: "Enter your Phone Number",
                inputTextEditingController: widget.phone
            ),
          ),
        ],
      ),
    );
  }
}
