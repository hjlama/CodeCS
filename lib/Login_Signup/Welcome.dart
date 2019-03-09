import 'package:flutter/material.dart';
import 'dart:math';
import 'package:ccs/Login_Signup/Login.dart';
import 'package:ccs/Login_Signup/SignUp.dart';
import 'package:ccs/Login_Signup/TabIndicationPainter.dart';

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
      key: _scaffoldKey,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: SingleChildScrollView(
          // Container for the background
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height
                : 775.0,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [left, right],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  //logo in the middle
                  padding: EdgeInsets.only(top: 75.0),
                  child: new Image(
                    width: 250.0,
                    height: 191.0,
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: _buildMenuBar(context),
                ),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      if (index == 0) {
                        setState(() {
                          right = Colors.white;
                          left = Colors.lightBlueAccent;
                        });
                      } else if (index == 1) {
                        setState(() {
                          left = Colors.white;
                          right = Colors.lightBlueAccent;
                        });
                      }
                    },
                    children: <Widget>[
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: Login(),
                      ),
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: SignUp(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _loginTapped,
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: left,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _signupTapped,
                child: Text(
                  "Signup",
                  style: TextStyle(
                      color: right,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loginTapped() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _signupTapped() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
