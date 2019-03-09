import 'package:ccs/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'ProgLang.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/*
 * This class is a widget class that creates the homepage grid
 */

class HomeCardGrid extends StatefulWidget {
  @override
  _HomeCardGridState createState() => _HomeCardGridState();
}

class _HomeCardGridState extends State<HomeCardGrid> {
  List<ProgLang> proglanglist = getProgLang();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.title,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              MdiIcons.accountCircle,
              size: 40.0,
            ),
            padding: const EdgeInsets.symmetric(),
            tooltip: 'Help',
            onPressed: signout,
          ),
        ],
      ),
//

      // grid made with local list
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: new SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: createProgLangCardItem(proglanglist, context),
            ),
          ),
        ],
      ),
    );
  }

  void signout() {

  }
}

void showHelpTab() async {
  new SimpleDialog(
    title: Text('Home'),
    children: <Widget>[
      new Container(
        child: Text(
            'This is the home page of the app which displays all the programming languages'),
      ),
      new MaterialButton(
          color: Colors.cyan,
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
            child: Text(
              "Okay",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontFamily: "WorkSansBold"),
            ),
          ),
          onPressed: () {
            //TODO back to home page
//            Navigator.pop(_);
          })
    ],
  );
}
