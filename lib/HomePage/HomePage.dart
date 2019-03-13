import 'package:ccs/HomePage/HomeCardGrid.dart';
import 'package:ccs/ReportPage/Report.dart';
import 'package:flutter/material.dart';
import 'package:ccs/bottom_navy_bar_rewrite.dart';
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
      child: new HomeCardGrid(),
    ),
    new Container(
      child: new Report(),
    ),
    new Container(
      child: new Settings(),
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
        backgroundColor: Theme.of(context).backgroundColor,
        body: TabBarView(
          controller: _tabController,
          children: _tabList,
        ),

        //bottom_navy_bar
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Theme.of(context).backgroundColor,
          onItemSelected: (index) => setState(() {
                _currentIndex = index;
                _tabController.animateTo(_currentIndex);
              }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              inactiveColor: Colors.lightBlue,
              activeColor: Colors.blue[900],
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.error),
              title: Text('Report'),
              inactiveColor: Colors.lightBlue,
              activeColor: Colors.blue[900],
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              inactiveColor: Colors.lightBlue,
              activeColor: Colors.blue[900],
            ),
          ],
        ));
  }
}
