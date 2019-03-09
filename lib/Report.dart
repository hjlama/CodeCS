import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  int _currentStep = 0;
  static var _focusNode = new FocusNode();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static ReportForm _reportForm = new ReportForm();

  List<Step> steps = [
    new Step(
      title: const Text('Problem page'),
      content: new TextFormField(
        focusNode: _focusNode,
        keyboardType: TextInputType.text,
        autocorrect: false,
        maxLines: 1,
        onSaved: (String input) {
          _reportForm.problemPage = input;
        },
        validator: (input) {
          if (input.isEmpty || input.length < 1) {
            return 'Please enter a page';
          }
        },
        decoration: new InputDecoration(
            labelText: 'Enter the page',
            hintText: 'Home page, Login, Sign etc',
            //filled: true,
            icon: const Icon(Icons.description),
            labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
      ),
    ),
    new Step(
      title: new Text('Problem'),
      content: new TextFormField(
        keyboardType: TextInputType.text,
        autocorrect: false,
        focusNode: _focusNode,
        onSaved: (String input) {
          _reportForm.problem = input;
        },
        validator: (input) {
          if (input.isEmpty || input.length < 10) {
            return 'Please enter the details ...';
          }
        },
        decoration: new InputDecoration(
            labelText: 'Enter your pblem',
            icon: const Icon(Icons.feedback),
            labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
      ),
    ),
    new Step(
      title: new Text('Confirm'),
      content: new ListBody(
        children: <Widget>[
          new Text('Page: ' + _reportForm.problemPage),
          new Text('Problems: ' + _reportForm.problem),
        ],
      ),
      isActive: true,
      state: StepState.indexed,
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
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Report problem',
          style: Theme.of(context).textTheme.title,
        ),
        centerTitle: true,
      ),
      body: new Container(
        child: new Form(
          key: _formKey,
          child: new ListView(children: <Widget>[
            new Stepper(
              type: StepperType.vertical,
              currentStep: _currentStep,
              onStepTapped: (int step) => setState(() => _currentStep = step),
              onStepContinue: () {
                setState(() {
                  if (_currentStep < 2) {
                    _currentStep = _currentStep + 1;
                  } else {
                    _currentStep = 0;
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (_currentStep > 0) {
                    _currentStep = _currentStep - 1;
                  } else {
                    _currentStep = 0;
                  }
                });
              },
              steps: steps,
            ),
          ]),
        ),
      ),
    );
  }

  submitform() {
    final FormState formState = _formKey.currentState;
    if (!formState.validate()) {
      print('_formKey error');
    } else {
      formState.save();
    }
  }
}

class ReportForm {
  String problemPage = '';
  String problem = '';
}
