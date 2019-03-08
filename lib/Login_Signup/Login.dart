import 'package:ccs/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
//      EdgeInsets.only(top: 20.0),
      child: new Column(
        children: <Widget>[
          // invisible widget to create gap in between
          new Opacity(
              opacity: 0.0,
              child: new Padding(
                padding: const EdgeInsets.only(top: 20),
              )),
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 300.0,
                  height: 200.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Email does not exist in the system';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                          onSaved: (input) => _email = input,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: InputBorder.none,
                            icon: Icon(
                              MdiIcons.email,
                              color: Colors.black,
                              size: 22.0,
                            ),
                          ),
                        ),
                      ),
                      // grey line separating email and password container
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 8.0, 20.0, 8.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Wrong password';
                            }
                          },
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                          onSaved: (input) => _password = input,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: InputBorder.none,
                            icon: Icon(
                              MdiIcons.lock,
                              color: Colors.black,
                              size: 22.0,
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Login button Container
              Container(
                margin: EdgeInsets.only(top: 185.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.lightBlue,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: Colors.white30,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: new LinearGradient(
                      colors: [Colors.blue, Colors.lightBlue],
                      begin: const FractionalOffset(0.2, 0.2),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.lightBlue,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 50.0),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "WorkSansBold"),
                      ),
                    ),
                    onPressed: login),
              ),
              Padding(
                // gap in between button n text
                padding: EdgeInsets.only(top: 290.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // the middle bar
                  children: <Widget>[
                    // left bar
                    Container(
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [Colors.white, Colors.white10],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      // size of the bar
                      width: 100.0, height: 1.0,
                    ),
                    // text
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        "Or login with ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontFamily: "WorkSansMedium"),
                      ),
                    ),
                    // right bar
                    Container(
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [Colors.white, Colors.white10],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      width: 100.0,
                      height: 1.0,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    //facebook widget
                    padding: EdgeInsets.only(top: 350.0, right: 50.0),
                    child: GestureDetector(
                      onTap: facebook_firebase,
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: new Icon(
                          MdiIcons.facebook,
                          color: Colors.blue[800],
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  // google
                  Padding(
                    //google widget
                    padding: EdgeInsets.only(top: 350.0, left: 30.0),
                    child: GestureDetector(
                      onTap: google_firebase,
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: new Icon(
                          MdiIcons.google,
                          color: Colors.blue[800],
                          size: 40,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    //google widget
                    padding: EdgeInsets.only(top: 350.0, left: 50.0),
                    child: GestureDetector(
                      onTap: google_firebase,
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: new Icon(
                          MdiIcons.naturePeople,
                          color: Colors.blue[800],
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

// when tapping the login button
  void login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }

}

void facebook_firebase() {
  //TODO facebook firebase login
}

void google_firebase() {
  //TODO google firebase login
}
