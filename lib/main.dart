import 'package:ccs/Problem.dart';
import 'package:ccs/ReportPage/Report.dart';
import 'package:ccs/testing/SignUp_firebase_test.dart';
import 'package:ccs/testing/form_firebase_testing.dart';
import 'package:flutter/material.dart';
import 'package:ccs/Login_Signup/Welcome.dart';
import 'package:ccs/testing/Login_firebase_test.dart';
import 'package:ccs/HomePage/HomePage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:ccs/Settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'CodeCS',
//      // first page
////      home: Welcome(),
////      home: Report(),
////      home: Login_firebase_test(),
//    home: HomePage(),
//      // theme pack
//      theme: ThemeData(
//            brightness: brightness,
//                    primaryColor: Colors.lightBlueAccent,
//            accentColor: Colors.lightBlue,
//            fontFamily: 'ProximaNova',
//            textTheme: TextTheme (
//              title: TextStyle (
//                  fontFamily: 'ProximaNova',
//                  fontSize: 25,
//                  fontWeight: FontWeight.bold)
//                  .copyWith (color: Colors.white),
//              body1: TextStyle (fontSize: 14.0, fontFamily: 'ProximaNova'),
//              subtitle: TextStyle (fontSize: 20.0, fontFamily: 'ProximaNova'),
//              button: TextStyle (
//                  fontSize: 14.0,
//                  fontFamily: 'ProximaNova',
//                  fontWeight: FontWeight.bold)
//                  .copyWith (color: Colors.white),
//              ),
//            appBarTheme: AppBarTheme (
//              color: Colors.lightBlue,
//              textTheme: TextTheme (
//                title: TextStyle (
//                    fontFamily: 'ProximaNova',
//                    fontSize: 25,
//                    fontWeight: FontWeight.bold),
//                ),
//              iconTheme: IconThemeData (color: Colors.white, size: 15.0),
//              ),
//            backgroundColor: Colors.white,
//            scaffoldBackgroundColor: Colors.white,
//          ),
//    );
    return new DynamicTheme(
      defaultBrightness: Brightness.light,
//          data: (brightness) => new ThemeData(
//            brightness: brightness,
//                    primaryColor: Colors.lightBlue,
//          ),
      data: (brightness) => _buildTheme(brightness),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          title: 'CodeCS',
          theme: theme,
          home: HomePage(),
        );
      },
    );
  }

//  ThemeData _buildTheme(Brightness brightness) {
//    return brightness == Brightness.dark
//        ? ThemeData.dark().copyWith(
//            textTheme: ThemeData.dark().textTheme.apply(
//                  bodyColor: Colors.white,
//                  displayColor: Colors.white,
//                  fontFamily: 'ProximaNova',
//
//
//                ),
//            backgroundColor: Colors.white10)
//        // Default mode
//        : ThemeData.light().copyWith(
//            primaryColor: Colors.lightBlueAccent,
//            accentColor: Colors.lightBlue,
////            textTheme: TextTheme(
////              title: TextStyle(
////                      fontFamily: 'ProximaNova',
////                      fontSize: 25,
////                      fontWeight: FontWeight.bold)
////                  .copyWith(color: Colors.white),
////              body1: TextStyle(
////                  fontSize: 14.0,
////                  fontFamily: 'ProximaNova',
////                  color: Colors.black),
////              subtitle: TextStyle(
////                  fontSize: 20.0,
////                  fontFamily: 'ProximaNova'),
////              button: TextStyle(
////                      fontSize: 14.0,
////                      fontFamily: 'ProximaNova',
////                      fontWeight: FontWeight.bold)
////                  .copyWith(color: Colors.white),
////            ),
//            appBarTheme: AppBarTheme(
//              color: Colors.lightBlue,
//              textTheme: TextTheme(
//                title: TextStyle(
//                    fontFamily: 'ProximaNova',
//                    fontSize: 25,
//                    fontWeight: FontWeight.bold),
//              ),
//              iconTheme: IconThemeData(color: Colors.white, size: 15.0),
//            ),
//            backgroundColor: Colors.white,
//            scaffoldBackgroundColor: Colors.white,
//          );
//  }
  ThemeData _buildTheme(Brightness brightness) {
    return brightness == Brightness.dark
        ? ThemeData.dark().copyWith(
            textTheme: ThemeData.dark().textTheme.apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                  fontFamily: 'ProximaNova',
                ),
//            primaryColor: Colors.green,
            backgroundColor: Colors.white10)
        : ThemeData.light().copyWith(
            textTheme: ThemeData.light().textTheme.apply(
                  bodyColor: Colors.black,
                  displayColor: Colors.black,
                  fontFamily: 'ProximaNova',
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
            backgroundColor: Colors.white);
  }
}
