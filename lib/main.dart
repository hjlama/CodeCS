import 'package:flutter/material.dart';
import 'package:ccs/Welcome.dart';
import 'package:ccs/Login_firebase_test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'CodeCS', home: Welcome());
//        home:HomePage());
  }
}
