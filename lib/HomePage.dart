import 'package:ccs/HomeCardGrid.dart';
import 'package:ccs/HomePage.dart';
import 'package:ccs/Report.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ccs/Settings.dart';
import 'package:firebase_auth/firebase_auth.dart';



class HomePage extends StatefulWidget {
//  HomePage({Key key, this.title}) : super(key: key);
  HomePage({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

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
    backgroundColor: Colors.white70,
        body: TabBarView(
          controller: _tabController,
          children: _tabList,
        ),

        //bottom_navy_bar
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.white,
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
