import 'package:flutter/material.dart';
import 'HomeCardGrid.dart';
import 'ProgLang.dart';

class CheatSheetPage extends StatelessWidget {
  final ProgLang progLang;

  CheatSheetPage({Key key, this.progLang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cheat Sheet',style: TextStyle(fontSize: 26),),
      ),
      body: Column(
       children: <Widget>[
         const Text('CheatSheetPage'),
       ],
      ),
    );
  }
}

class CheatSheet {
  String name;
  String img;

  CheatSheet({this.name, this.img});
}

//class ProgLang {
//  final String name;
//  final String image;
//  var id;
//
//  ProgLang(this.id, this.name, this.image);
//}
