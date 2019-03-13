import 'package:ccs/Problem.dart';
import 'package:ccs/ReportPage/Report.dart';
import 'package:ccs/testing/SignUp_firebase_test.dart';
import 'package:ccs/testing/form_firebase_testing.dart';
import 'package:flutter/material.dart';
import 'package:ccs/Login_Signup/Welcome.dart';
import 'package:ccs/testing/Login_firebase_test.dart';
import 'package:ccs/HomePage/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'CodeCS',
      // first page
//      home: Welcome(),
      home: Report(),
//      home: ReportTest(),
      // theme pack
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlueAccent,
        accentColor: Colors.lightBlue,
        fontFamily: 'ProximaNova',
        textTheme: TextTheme(
          title: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 25,
                  fontWeight: FontWeight.bold)
              .copyWith(color: Colors.white),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'ProximaNova'),
          subtitle: TextStyle(fontSize: 20.0, fontFamily: 'ProximaNova'),
          button: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'ProximaNova',
                  fontWeight: FontWeight.bold)
              .copyWith(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.lightBlue,
          textTheme: TextTheme(
            title: TextStyle(
                fontFamily: 'ProximaNova',
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.white, size: 15.0),
        ),
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
//        home: HomePage());
//        home:Signup_firebase_test());
  }
}
