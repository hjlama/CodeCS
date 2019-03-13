import 'package:flutter/material.dart';
import 'package:dynamic_theme/theme_switcher_widgets.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

//final ValueChanged<Brightness> onSelectedTheme;

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
                child: Text(
                  'Change mode',
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
              RadioListTile<Brightness>(
                value: Brightness.light,
                groupValue: Theme.of(context).brightness,
                onChanged: (Brightness value) {
//                  onSelectedTheme(Brightness.light);
                  changeBrightness();
//                  changeColor();
                },
                title: const Text('Default Mode'),
              ),
              RadioListTile<Brightness>(
                value: Brightness.dark,
                groupValue: Theme.of(context).brightness,
                onChanged: (Brightness value) {
//                  onSelectedTheme(Brightness.dark);
                  changeBrightness();
//                  changeColor();
                },
                title: const Text('Dark Mode'),
              ),
//              onSelectedTheme: (brightness){
//              DynamicTheme.of(context).setBrightness(brightness);
//              }
              new Container(
                child: new FlatButton(
                  onPressed: () {
                    showAboutDialog(
                        context: context,
                        applicationName: 'CodeCS',
                        applicationVersion: 'ver 1.0',
                        applicationIcon: Image.asset('assets/appicon.png',width: 65.0,height: 65.0));
                  },
                  child: new Text('About this app'),
                ),
              ),
            ],
          )),
    );
  }

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

//  void changeColor() {
//    DynamicTheme.of(context).setThemeData(new ThemeData(
//        primaryColor: Theme.of(context).primaryColor == Colors.indigo
//            ? Colors.green[300]
//            : Colors.blue));
//  }
}
