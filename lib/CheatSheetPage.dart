import 'package:flutter/material.dart';
import 'HomeCardGrid.dart';
import 'ProgLang.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class CheatSheetPage extends StatelessWidget {
  final ProgLang proglang;

  CheatSheetPage({Key key, this.proglang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          'Cheat Sheet',
//          style: TextStyle(fontSize: 26),
//        ),
//      ),
//
//    );
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Document"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path:proglang.cs);
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
