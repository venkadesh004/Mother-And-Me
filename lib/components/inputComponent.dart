import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputComponent extends StatefulWidget {
  const InputComponent({Key? key,
    required this.inputIcon,
    required this.inputHintText,
    required this.inputTextEditingController
  }) : super(key: key);

  final inputIcon;
  final inputHintText;
  final inputTextEditingController;

  @override
  State<InputComponent> createState() => _InputComponentState();
}

class _InputComponentState extends State<InputComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      width: 350,
      decoration: BoxDecoration(
          color: Color.fromRGBO(217,217,217,1),
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: widget.inputTextEditingController,
        decoration: InputDecoration(
            icon: Icon(
              widget.inputIcon,
              color: Colors.grey,
            ),
            hintText: widget.inputHintText,
            hintStyle: GoogleFonts.itim(),
            border: InputBorder.none
        ),
      ),
    );
  }
}
