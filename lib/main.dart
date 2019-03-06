
import 'package:flutter/material.dart';

import 'package:ccs/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'CodeCS',
        home: Login());
//        home:HomePage());
  }
}
