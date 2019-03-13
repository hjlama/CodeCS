import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseApp app = FirebaseApp(options: )
final feedbackForm = FirebaseDatabase.instance.reference ().child (
    'feedbackForm');

class ReportForm {
  String key;
  String page = '';
  String problem = '';

  ReportForm (this.page, this.problem);

  ReportForm.fromSnapshot(DataSnapshot snapshot)
      :
        key = snapshot.key,
        page = snapshot.value['page'],
        problem = snapshot.value['problem'];

  toJson () {
    return {
      'page': page,
      'problem': problem,
    };
  }
}

class ReportStepper extends StatefulWidget {
  @override
  _ReportStepperState createState () => _ReportStepperState ();
}

class _ReportStepperState extends State<ReportStepper> {
  int currStep = 0;
  static var _focusNode = new FocusNode();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static ReportForm _reportForm = new ReportForm('', '');
DatabaseReference _reportFormRef;

  List<Step> steps = [
    new Step(
        title: const Text('Page'),
        //subtitle: const Text('Enter your name'),
        isActive: true,
        //state: StepState.error,
        state: StepState.indexed,
        content: new TextFormField(
          focusNode: _focusNode,
          keyboardType: TextInputType.text,
          autocorrect: false,
          onSaved: (String value) {
            _reportForm.page = value;
          },
          maxLines: 1,
          validator: (value) {
            if ( value.isEmpty || value.length < 1 ) {
              return 'Please enter the problem page';
            }
          },
          initialValue: 'testing page form',
          decoration: new InputDecoration(
              labelText: 'Please enter the problem page',
              hintText: 'Welcome page, home page etc',
              //filled: true,
              icon: const Icon(Icons.description),
              labelStyle:
              new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          )),
    new Step(
      title: const Text('Problem'),
      //subtitle: const Text('Subtitle'),
      isActive: true,
      //state: StepState.editing,
      state: StepState.indexed,
      content: new TextFormField(
        keyboardType: TextInputType.phone,
        autocorrect: false,
        validator: (value) {
          if ( value.isEmpty || value.length < 10 ) {
            return 'Please enter valid number';
          }
        },
        onSaved: (String value) {
          _reportForm.problem = value;
        },
        initialValue: 'testing the problem form .....',
        decoration: new InputDecoration(
            labelText: 'Enter the problem',
            hintText: 'please enter',
            icon: const Icon(Icons.feedback),
            labelStyle:
            new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        ),
      ),
  ];

  @override
  void initState () {
    super.initState ();
    _focusNode.addListener (
          () {
        setState (() {});
        print ('Has focus: $_focusNode.hasFocus');
      },
          );
    final FirebaseDatabase database = FirebaseDatabase(app : app);
  }

  @override
  void dispose () {
    _focusNode.dispose ();
    super.dispose ();
  }

  void

  @override
  Widget build (BuildContext context) {
    void showSnackBarMessage (String message,
                              [MaterialColor color = Colors.blue]) {
      Scaffold.of (context)
          .showSnackBar (new SnackBar(content: new Text(message)));
    }

    void _submitDetails () {
      final FormState formState = _formKey.currentState;

      if ( !formState.validate () ) {
        showSnackBarMessage ('Please enter correct data');
      } else {
        formState.save ();

        print ("Name: ${_reportForm.page}");
        print ("Phone: ${_reportForm.problem}");
        formState.reset();
        _reportFormRef.push().set(_reportForm.toJson());

        showDialog (
          context: context,
          child: new AlertDialog(
            title: new Text("Details"),
            //content: new Text("Hello World"),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text("Page : " + _reportForm.page),
                  new Text("Problem : " + _reportForm.problem),
                ],
                ),
              ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  showSnackBarMessage ('form submitted successfully');
                  Navigator.of (context).pop ();
                },
                ),
            ],
            ),
          );
      }
    }

    return new Container(
        child: new Form(
          key: _formKey,
          child: new ListView(children: <Widget>[
            new Stepper(
              steps: steps,
              type: StepperType.vertical,
              currentStep: this.currStep,
              onStepContinue: () {
                setState (() {
                  if ( currStep < steps.length - 1 ) {
                    currStep = currStep + 1;
                  } else {
                    currStep = 0;
                  }
                });
              },
              onStepCancel: () {
                setState (() {
                  if ( currStep > 0 ) {
                    currStep = currStep - 1;
                  } else {
                    currStep = 0;
                  }
                });
              },
              onStepTapped: (step) {
                setState (() {
                  currStep = step;
                });
              },
              ),
            RaisedButton (
              onPressed: _submitDetails,
              padding: const EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 150.0),
              color: Colors.white,
              child: Container (
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow (
                      color: Colors.lightBlue,
                      offset: Offset (1.0, 6.0),
                      blurRadius: 15.0,
                      ),
                    BoxShadow (
                      color: Colors.white30,
                      offset: Offset (1.0, 6.0),
                      blurRadius: 150.0,
                      ),
                  ],
                  gradient: LinearGradient (
                      colors: [Colors.blue, Colors.lightBlue],
                      begin: const FractionalOffset(0.2, 0.2),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.all (Radius.circular (15.0)),
                  ),
                padding: const EdgeInsets.fromLTRB(75.0, 20.0, 75.0, 20.0),
                child: Text (
                  'Confirm',
                  style: Theme
                      .of (context)
                      .textTheme
                      .button,
                  ),
                ),
              ),
          ]),
          ));
  }
}
