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
    ProgLang('Java', 'assets/java/java.png', '/Users/adriehui/ccs/assets/java/cs-java.jpg'),
    ProgLang('JavaScript', 'assets/js.png', '/Users/adriehui/ccs/assets/javascript/cs-javascript.pdf'),
    ProgLang('Linux', 'assets/linux.png', '/Users/adriehui/ccs/assets/linux/cs-linux.pdf'),
    ProgLang('Python', 'assets/python.png', '/Users/adriehui/ccs/assets/python/cs-python.pdf'),
    ProgLang('CSS', 'assets/css/css.png', '/Users/adriehui/ccs/assets/css/cs-css.pdf'),
    ProgLang('HTML', 'assets/html/html.png', '/Users/adriehui/ccs/assets/html/cs-html.pdf'),
    ProgLang('C#', 'assets/c/c.png', '/Users/adriehui/ccs/assets/c/cs-c.pdf'),
    ProgLang('MySQL', 'assets/mysql.png', '/Users/adriehui/ccs/assets/mysql/cs-mysql.pdf'),
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
                  builder: (context) => CheatSheetPage(proglang: proglang,name: proglang.name)),
            );
          },
          child: new Card(
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            elevation: 4.0,
            child: new Image(
              image: AssetImage(proglang.image),
              fit: BoxFit.cover,
            ),
          ),

        ),

      );

      listElementWidgetList.add(listItem);
    }
  }
  return listElementWidgetList;
}
