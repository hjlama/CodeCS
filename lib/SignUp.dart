import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23),
      child: Column(
        children: <Widget>[
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
                  width: 300,height: 360,child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Name',
                        ),
                        onSaved: (String value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String value) {
                          return value.contains('@') ? 'Do not use the @ char.' : null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 170.0),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),),
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
                          onPressed: () =>
                              showInSnackBar("Login button pressed")),
                    ),

                  ],
                ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
