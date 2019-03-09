import 'package:flutter/material.dart';
import 'package:ccs/HomePage/HomeCardGrid.dart';
import 'ProgLang.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class CheatSheetPage extends StatelessWidget {
  final ProgLang proglang;
  final String name;

  CheatSheetPage({Key key, this.proglang, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        primary: true,
        appBar: AppBar(
          title: Text(
            '$name Cheat Sheet',
            style: Theme.of(context).textTheme.title,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: proglang.cs);
  }
}
