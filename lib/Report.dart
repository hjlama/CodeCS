import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Report problem',
          style: Theme.of(context).textTheme.title,
        ),
        centerTitle: true,
      ),
      body: new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Column(
            //TODO create select roll
            children: <Widget>[new TextField(), new TextFormField()],
          )),
      //TODO create a text field form

      //TODO create a submit button

      //TODO send report form to Firebase
    );
  }
}
