import 'package:flutter/material.dart';
import 'CheatSheetPage.dart';
class ProgLang {
  final String name;
  final String image;
  final String cs;

  ProgLang(this.name, this.image, this.cs);
}

// Programming language list
 //TODO  1. find all chest sheets 2. adding more cards

List<ProgLang> getProgLang() {
  return [
    ProgLang('Java', 'assets/java.png', '/Users/adriehui/ccs/assets/cs-java.jpg'),
    ProgLang('JavaScript', 'assets/js.png', 'assets/Java-Cheat-Sheet.pdf'),
    ProgLang('Linux', 'assets/linux.png', 'assets/java.cs.jpg'),
    ProgLang('Python', 'assets/python.png', 'assets/cs-python.pdf')
  ];
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
        child: new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => CheatSheetPage(proglang: proglang,)),
            );
          },
          child: new Card(
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 4.0,
            child: new Image(
              image: AssetImage(proglang.image),
              fit: BoxFit.contain,
            ),
          ),
        ),
      );

      listElementWidgetList.add(listItem);
    }
  }
  return listElementWidgetList;
}
