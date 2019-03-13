import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//FirebaseApp app = FirebaseApp(name: )
final feedbackForm =
    FirebaseDatabase.instance.reference().child('feedbackForms');

class ReportForm {
  String key;
  String page = '';
  String problem = '';

  ReportForm(this.page, this.problem);

  ReportForm.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        page = snapshot.value['page'],
        problem = snapshot.value['problem'];

  toJson() {
    return {
      'page': page,
      'problem': problem,
    };
  }
}

class ReportStepper extends StatefulWidget {
  @override
  _ReportStepperState createState() => _ReportStepperState();
}

class _ReportStepperState extends State<ReportStepper> {
  int _currentStep = 0;
  static var _focusNode = new FocusNode();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static ReportForm _reportForm = new ReportForm('', '');
  final reportFormRef =
      FirebaseDatabase.instance.reference().child('feedbackForm');

  List<Step> steps = [
    new Step(
        title: const Text('Page'),
        //subtitle: const Text('Enter your name'),
        isActive: true,
        //state: StepState.error,
        state: StepState.indexed,
        content: new TextFormField(
//          focusNode: _focusNode,
          keyboardType: TextInputType.text,
          autocorrect: false,
          autofocus: true,
          onSaved: (String value) {
            _reportForm.page = value;
          },
          maxLines: 1,
          validator: (value) {
            if (value.isEmpty || value.length < 1) {
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
        autofocus: true,
        validator: (value) {
          if (value.isEmpty || value.length < 10) {
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
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      print('Has focus: $_focusNode.hasFocus');
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.teal]) {
      Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text(
        message,
        style: TextStyle(fontSize: 20),
      )));
    }

    void _addToDB() {
      Map<String, String> reportFormMap = <String, String>{
        'Page': _reportForm.page,
        'Problem': _reportForm.problem,
      };
      reportFormRef.set(reportFormMap).then((_) {
        Navigator.pop(context);
      });
    }

    void _submitDetails() {
      final FormState formState = _formKey.currentState;

      if (!formState.validate()) {
        showSnackBarMessage('Please enter correct data');
      } else {
        formState.save();
        print("Name: ${_reportForm.page}");
        print("Phone: ${_reportForm.problem}");
        formState.reset();

        showDialog(
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
                  showSnackBarMessage('form submitted successfully');
                  Navigator.of(context).pop();
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
          currentStep: this._currentStep,
          onStepContinue:
              _currentStep < 1 ? () => setState(() => _currentStep += 1) : null,
          onStepCancel:
              _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
          onStepTapped: (int step) => setState(() => _currentStep = step),
        ),
        new Container(
            child: FractionallySizedBox(
                widthFactor: 0.6,
                child: FlatButton(
                  onPressed: _submitDetails,
                  color: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.white),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                ))),
      ]),
    ));
  }
}
