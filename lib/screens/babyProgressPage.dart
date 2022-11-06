import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mother_and_me/components/loginRegisterLayout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mother_and_me/components/constants.dart';
import 'package:mother_and_me/screens/userProfile.dart';

class BabyProgress extends StatefulWidget {
  const BabyProgress({Key? key,
    required this.imageLink,
    required this.imageText,
  }) : super(key: key);

  final imageLink;
  final imageText;

  @override
  State<BabyProgress> createState() => _BabyProgressState();
}

class _BabyProgressState extends State<BabyProgress> {
  @override
  Widget build(BuildContext context) {
    return LoginRegisterLayout(
        redirectingPage: BabyProgressDetails(
          imageLink: widget.imageLink,
          imageText: widget.imageText,
        ),
        leadingTop: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
          },
          icon: Icon(
            Icons.person
          ),
        )
    );
  }
}

class BabyProgressDetails extends StatefulWidget {
  const BabyProgressDetails({Key? key,
    required this.imageLink,
    required this.imageText
  }) : super(key: key);

  final imageLink;
  final imageText;

  @override
  State<BabyProgressDetails> createState() => _BabyProgressDetailsState();
}

class _BabyProgressDetailsState extends State<BabyProgressDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.only(top: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(
                  image: NetworkImage(widget.imageLink)
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(20),
            child: Text(
              widget.imageText,
              style: GoogleFonts.itim(),
              textAlign: TextAlign.center,
            )
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              "Predicted Month Of Delivery: ${months[monthOfDeliver-1]}",
              style: GoogleFonts.itim(
                fontSize: 17
              ),
            ),
          )
        ],
      ),
    );
  }
}
