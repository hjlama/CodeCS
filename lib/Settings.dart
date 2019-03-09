import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: Theme.of(context).textTheme.title,),
        centerTitle: true,
      ),
      body: new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[new TextField(), new TextFormField()],
          )),
    );
  }
}
