import 'package:flutter/material.dart';
import 'package:mother_and_me/screens/loginPage.dart';
import 'package:mother_and_me/screens/splashScreen.dart';
import 'package:mother_and_me/screens/homeScreen.dart';
import 'package:mother_and_me/screens/userProfile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mother And Me',
      home: SplashScreen(),
    );
  }
}
