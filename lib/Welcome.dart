import 'package:flutter/material.dart';
import 'Login.dart';
import 'SignUp.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  String _email, _password;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  PageController _pageController;
  Color left = Colors.lightBlueAccent;
  Color right = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey, ,
        body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll)
    {
      overscroll.disallowGlow();
    },child: SingleChildScrollView(
    child: Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height >= 775.0
    ? MediaQuery.of(context).size.height:775.0,
    decoration: new BoxDecoration(
    gradient: new LinearGradient(colors: [ left,right], begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 1.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp),
    ),
    child: Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
    Padding(//logo in the middle
    padding: EdgeInsets.only(top: 75.0),
    child: new Image( width: 250,height: 190,fit: BoxFit.fill,image: AssetImage('assets/logo.png')),
    ),
    Padding(
    padding: EdgeInsets.only(top:20.0),
    child: _buildMenuBar(context),
    ),
    Expanded(
    flex: 2,
    child: PageView(
    controller: _pageController,
    onPageChanged: (index){
    if (index ==0){
    setState(() {
    right = Colors.white;
    left = Colors.lightBlueAccent;
    });
    }else if (index == 1){
    setState(() {
    left = Colors.white;
    right = Colors.lightBlueAccent;
    });
    }
    },
    children: <Widget>[
    new ConstrainedBox(constraints: const BoxConstraints.expand(),child: Login(),),
    new ConstrainedBox(constraints: const BoxConstraints.expand(),child: SignUp(context),),
    ],
    ),
    ),
    ],
    ),
    ),
    )
    ,
    )
    ,
    );
  }
