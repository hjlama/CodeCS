import 'package:ccs/testing/SignUp_firebase_test.dart';
import 'package:flutter/material.dart';
import 'package:ccs/Login_Signup/Welcome.dart';
import 'package:ccs/testing/Login_firebase_test.dart';
import 'package:ccs/HomePage/HomePage.dart';

void main() {
  runApp( MyApp( ) );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp
    (
        title: 'CodeCS',
        home: Welcome());
//        home: HomePage());
//        home:Signup_firebase_test());
  }
}
