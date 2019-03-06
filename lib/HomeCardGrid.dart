import 'package:flutter/material.dart';

import 'CheatSheetPage.dart';
import 'ProgLang.dart';

/*
 * This class is a widget class that creates the homepage grid
 */

class HomeCardGrid extends StatefulWidget {
  @override
  _HomeCardGridState createState() => _HomeCardGridState();
}

class _HomeCardGridState extends State<HomeCardGrid> {
  List<ProgLang> proglanglist = getProgLang();

  // in app list
//  List<ProgLang> proglanglist = [
//    ProgLang(1, 'Java', 'assets/java.png'),
//    ProgLang(2, 'JavaScript', 'assets/js.png'),
//    ProgLang(3, 'Linux', 'assets/linux.png'),
//    ProgLang(4, 'Python', 'assets/python.png')
//  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),

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

      // app getting programming language from firebase
//      body: StreamBuilder(
//          stream: Firestore.instance.collection('proglang').snapshots(),
//          builder: (context, snapshot) {
//            if (!snapshot.hasData)
//              return new Container(
//                child: new Center(
//                  child: new CircularProgressIndicator(),
//                ),
//              );
//            List proglanglist = snapshot.data;
//            return new CustomScrollView(
//              primary: false,
//              slivers: <Widget>[
//                new SliverPadding(
//                  padding: const EdgeInsets.all(10.0),
//                  sliver: new SliverGrid.count(
//                    crossAxisCount: 2,
//                    mainAxisSpacing: 10.0,
//                    crossAxisSpacing: 10.0,
//                    children: createProgLangCardItem(proglanglist, context),
//                  ),
//                ),
//              ],
//            );
//          }),
    );
  }
}

// create a card layout for the prog lang in the home page
List<Widget> createProgLangCardItem(
    List<ProgLang> proglangs, BuildContext context) {
  List<Widget> listElementWidgetList = new List<Widget>();
  if (proglangs != null) {
    var lengthOfList = proglangs.length;
    for (int i = 0; i < lengthOfList; i++) {
      ProgLang proglang = proglangs[i];

      var listItem = new GridTile(
        footer: new GridTileBar(
          backgroundColor: Colors.white70,
          title: new Text(proglang.name),
        ),
        child: new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => CheatSheetPage(progLang: proglang)),
            );
          },
          child: new Card(
            child: Image.asset(proglang.image),
          ),
        ),
      );

      listElementWidgetList.add(listItem);
    }
  }
  return listElementWidgetList;
}

List<ProgLang> getProgLang() {
  return [
    ProgLang('Java', 'assets/java.png', 'assets/java.cs.jpg'),
    ProgLang('JavaScript', 'assets/js.png', 'assets/java.cs.jpg'),
    ProgLang('Linux', 'assets/linux.png', 'assets/jaava.cs.jpg'),
    ProgLang('Python', 'assets/python.png', 'assets/jaava.cs.jpg')
  ];
}
