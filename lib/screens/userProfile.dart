import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:mother_and_me/components/loginRegisterLayout.dart';
import 'package:mother_and_me/components/constants.dart';
import 'package:mother_and_me/screens/homeScreen.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return LoginRegisterLayout(
        redirectingPage: UserDetails(),
        leadingTop: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(
            Icons.home
          ),
        )
    );
  }
}

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserSubBox(userQues: "User", userSol: motherName),
            UserSubBox(userQues: "Hospital Name", userSol: hos),
            UserSubBox(userQues: "Email", userSol: email),
            UserSubBox(userQues: "Phone", userSol: phone),
            UserSubBox(userQues: "Present Primetes", userSol: presentPrim.toString()),
            UserSubBox(userQues: "Predicted Delivery", userSol: months[monthOfDeliver-1]),
          ],
        ),
      ),
    );
  }
}

class UserSubHeading extends StatefulWidget {
  const UserSubHeading({Key? key, required this.userQuestion}) : super(key: key);

  final userQuestion;

  @override
  State<UserSubHeading> createState() => _UserSubHeadingState();
}

class _UserSubHeadingState extends State<UserSubHeading> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.userQuestion,
      style: TextStyle(
        fontSize: 25
      ),
    );
  }
}

class UserSubHeadingSol extends StatefulWidget {
  const UserSubHeadingSol({Key? key, required this.userSol}) : super(key: key);

  final userSol;

  @override
  State<UserSubHeadingSol> createState() => _UserSubHeadingSolState();
}

class _UserSubHeadingSolState extends State<UserSubHeadingSol> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        widget.userSol,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey
        ),
      ),
    );
  }
}

class UserSubBox extends StatefulWidget {
  const UserSubBox({Key? key,
    required this.userQues,
    required this.userSol,
  }) : super(key: key);

  final userQues;
  final userSol;

  @override
  State<UserSubBox> createState() => _UserSubBoxState();
}

class _UserSubBoxState extends State<UserSubBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserSubHeading(userQuestion: widget.userQues),
          UserSubHeadingSol(userSol: widget.userSol)
        ],
      ),
    );
  }
}
