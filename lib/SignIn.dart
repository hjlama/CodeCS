import 'package:ccs/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class SignIn extends StatelessWidget {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Please type email';
                    }
                  },
                  onSaved: (input) => _email = input,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  validator: (input) {
                    if (input.length < 6) {
                      return 'pwd needs to be at least 6 char';
                    }
                  },
                  onSaved: (input) => _password = input,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                RaisedButton(
                  onPressed: login,
                  child: Text('Login'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push( context,
            MaterialPageRoute(builder: (context) => HomePage(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
