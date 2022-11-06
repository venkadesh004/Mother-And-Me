import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginRegisterLayout extends StatefulWidget {
  const LoginRegisterLayout({Key? key,
    required this.redirectingPage,
    required this.leadingTop
  }) : super(key: key);

  final redirectingPage;
  final leadingTop;

  @override
  State<LoginRegisterLayout> createState() => _LoginRegisterLayoutState();
}

class _LoginRegisterLayoutState extends State<LoginRegisterLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: widget.leadingTop,
        title: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Text(
            "Mother And Me",
            style: GoogleFonts.itim(),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(82, 128, 198, 0.75),
      ),
      body: Container(
        color: Color.fromRGBO(82, 128, 198, 0.75),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
            ),
            child: widget.redirectingPage
        ),
      ),
    );
  }
}
