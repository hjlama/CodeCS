import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';

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
                elevation: 2.0,
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 300.0,
                  height: 300.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please type email';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                          onSaved: (input) => _email = input,
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                      ),
                      // grey line separating email and password container
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please type email';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                          onSaved: (input) => _password = input,
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                      ),
                      //TODO fix the problem with the button
                      Container(
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: MaterialButton(
                            color: Colors.cyan,
                            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 42.0),
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
                    ],
                  ),
                ),
              ),
            ],
          )
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
