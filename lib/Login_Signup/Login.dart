import 'package:ccs/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
//  bool _success;
//  String _userID;
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookSignIn = new FacebookLogin();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, //      EdgeInsets.only(top: 20.0),
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
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    onPressed: login),
              ),
              Padding(
                // gap in between button n text
                padding: EdgeInsets.only(top: 280.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // the middle bar
                  children: <Widget>[
                    // left bar
                    Container(
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [Colors.black12, Colors.black87],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      // size of the bar
                      width: 90.0,
                      height: 1.0,
                    ),
                    // Text
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        "Or login with",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(color: Colors.black87),
                      ),
                    ),
                    // right bar
                    Container(
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [Colors.black87, Colors.black12],
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
                  //facebook widget
                  Padding(
                    padding:
                        EdgeInsets.only(top: 350.0, left: 10.0, right: 15.0),
                    child: GestureDetector(
                        onTap: facebookFirebaseLogin,
                        child: _buttonDecor(MdiIcons.facebook)),
                  ),

                  // wechat login
                  Padding(
                    //google widget
                    padding:
                        EdgeInsets.only(top: 350.0, right: 15.0, left: 10.0),
                    child: GestureDetector(
                      onTap: wechatLogin,
                      child: _buttonDecor(MdiIcons.wechat),
                    ),
                  ),
//

                  // google
                  Padding(
                    //google widget

                    padding:
                        EdgeInsets.only(top: 350.0, left: 10.0, right: 10.0),
                    child: GestureDetector(
                      onTap: googleFirebaseLogin,
                      child: _buttonDecor(MdiIcons.google),
                    ),
                  ),
//                    ),
//                  ),

                  //Anonymous login button
                  Padding(
                    padding: EdgeInsets.only(top: 350.0, left: 15.0),
                    child: GestureDetector(
                      onTap: anonLogin,
                      child: _buttonDecor(MdiIcons.accountTie),
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

// Method : Login in with Firebase w/ (email, password)
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

  // Method : login anonymously
  Future<void> anonLogin() async {
    try {
      FirebaseUser user = await FirebaseAuth.instance.signInAnonymously();
      print('Signed in ${user.uid}');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomePage(user: user)));
    } catch (e) {
      print(e.message);
    }
  }

  // Method : login with Google
  Future<void> googleFirebaseLogin() async {
//    try {
//      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
//      GoogleSignInAuthentication googleSignInAuthentication =
//          await googleSignInAccount.authentication;
//      final AuthCredential credential = GoogleAuthProvider.getCredential(
//        accessToken: googleSignInAuthentication.accessToken,
//        idToken: googleSignInAuthentication.idToken,
//      );
//
//      FirebaseUser user = await _firebaseAuth.signInWithCredential(credential);
//      assert(user.email != null);
//      assert(!user.isAnonymous);
//      assert(await user.getIdToken() != null);
//
//      final FirebaseUser currentUser = await _firebaseAuth.currentUser();
//      assert(user.uid == currentUser.uid);
//
//      Navigator.push(context,
//          MaterialPageRoute(builder: (context) => HomePage(user: user)));
//    } catch (e) {
//      errorSnackBar(e);
//    }
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage(user: user)));
      } else {
        debugPrint('Google sign in failed.');
      }
    });
//  }
  }

  Future<Null> facebookFirebaseLogin() async {
    final FacebookLoginResult result =
        await _facebookSignIn.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
//        final FacebookAccessToken accessToken = result.accessToken;
//        _showMessage('''
//         Logged in!
//
//         Token: ${accessToken.token}
//         User id: ${accessToken.userId}
//         Expires: ${accessToken.expires}
//         Permissions: ${accessToken.permissions}
//         Declined permissions: ${accessToken.declinedPermissions}
//         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
//        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
//        _showMessage('Something went wrong with the login process.\n'
//            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

//  void _showMessage(String message) {
//    setState(() {
//      _message = message;
//    });
//  }
//
//  String _message = 'Log in/out by pressing the buttons below.';

  void errorSnackBar(String errormsg) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(errormsg)),
    );
  }

//}

// Method: to create social login button in Welcome page
  _buttonDecor(IconData icon) {
    return new Container(
      padding: const EdgeInsets.all(15.0),
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: new Icon(
        icon,
        color: Colors.blue[800],
        size: 30.0,
      ),
    );
  }
}

void wechatLogin() {
  //TODO implementing wechat login
//  fluwx
//      .sendAuth(scope: "snsapi_userinfo", state: "wechat_sdk_demo_test")
//      .then((data) {});
}
