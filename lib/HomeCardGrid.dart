import 'package:ccs/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
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
        title: Text(
          'Home',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            tooltip: 'Help',
            onPressed: showDialog,
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

//// create a card layout for the prog lang in the home page
//List<Widget> createProgLangCardItem(
//    List<ProgLang> proglangs, BuildContext context) {
//  List<Widget> listElementWidgetList = new List<Widget>();
//  if (proglangs != null) {
//    var lengthOfList = proglangs.length;
//    for (int i = 0; i < lengthOfList; i++) {
//      ProgLang proglang = proglangs[i];
//
//      var listItem = new GridTile(
//        child: new GestureDetector(
//          onTap: () {
//            Navigator.push(
//              context,
//              new MaterialPageRoute(
//                  builder: (context) => CheatSheetPage(proglang: proglang,)),
//            );
//          },
//          child: new Card(
//            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//            shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(10.0)),
//            elevation: 4.0,
//            child: new Image(
//              image: AssetImage(proglang.image),
//              fit: BoxFit.contain,
//            ),
//          ),
//        ),
//      );
//
//      listElementWidgetList.add(listItem);
//    }
//  }
//  return listElementWidgetList;
//}

// moved to ProgLang class
//List<ProgLang> getProgLang() {
//  return [
//    ProgLang('Java', 'assets/java.png', '/Users/adriehui/ccs/assets/cs-java.jpg'),
//    ProgLang('JavaScript', 'assets/js.png', 'assets/Java-Cheat-Sheet.pdf'),
//    ProgLang('Linux', 'assets/linux.png', 'assets/java.cs.jpg'),
//    ProgLang('Python', 'assets/python.png', 'assets/cs-python.pdf')
//  ];
//}
