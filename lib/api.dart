import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mother_and_me/screens/loginPage.dart';

import './screens/homeScreen.dart';
import './components/constants.dart';

Future<void> loginRequest(context, userEmail, userPassword) async {
  final response = await http.post(Uri.parse("https://mother-and-me-backend.onrender.com/user/login"), body: {
    "email": userEmail,
    "password": userPassword
  });
  var data = jsonDecode(response.body)["body"];
  // print(jsonDecode(data)["body"]);
  motherName = data["username"];
  hos = data["hospitalName"];
  email = data["email"];
  phone = data["phone"];
  monthOfPrim = data["initialPrimetes"];
  presentPrim = presentPrimFinder();
  if (response.statusCode == 200) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    // return jsonEncode(response.body);
  }
  // } else {
  //   return jsonEncode(response.body);
  // }
}

Future<void> signupRequest(context, userEmail, username, hosName, month, phone, password) async {
  final response = await http.post((Uri.parse("https://mother-and-me-backend.onrender.com/user/signup")), body: {
    "email": userEmail,
    "hospitalName": hosName,
    "username": username,
    "phone": phone,
    "initialPrimetes": month,
    "password": password
  });

  var data = jsonDecode(response.body);

  if (response.statusCode == 201) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  } else {
    print(data);
  }
}