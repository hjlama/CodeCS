import 'package:ccs/HomeCardGrid.dart';
import 'package:ccs/HomePage.dart';
import 'package:ccs/Report.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ccs/Settings.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  List<Widget> _tabList = [
    new Container(
      child: HomeCardGrid(),
    ),
    new Container(
      child: Report(),
    ),
    new Container(
      child: Settings(),
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
        body: TabBarView(
          controller: _tabController,
          children: _tabList,
        ),

//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: _currentIndex,
//        onTap: (currentIndex) {
//          setState(() {
//            _currentIndex = currentIndex;
//          });
//
//          _tabController.animateTo(_currentIndex);
//        },
//        items: [
//          BottomNavigationBarItem(title: Text('Home'), icon: Icon(Icons.home)),
//          BottomNavigationBarItem(
//              title: Text('Report'), icon: Icon(Icons.error)),
//          BottomNavigationBarItem(
//              title: Text("Settings"), icon: Icon(Icons.settings))
//        ],
//      ),

        //bottom_navy_bar
        bottomNavigationBar: BottomNavyBar(
          onItemSelected: (index) => setState(() {
                _currentIndex = index;
                _tabController.animateTo(_currentIndex);
              }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.blueAccent,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.error),
                title: Text('Report'),
                activeColor: Colors.blueAccent),
            BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
                activeColor: Colors.blueAccent),

          ],
        ));
  }
}
