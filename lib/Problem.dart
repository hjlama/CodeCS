import 'package:flutter/material.dart';

class Problem extends StatefulWidget {
  @override
  _ProblemState createState() => new _ProblemState();
}

class _ProblemState extends State<Problem> {
  int currStep = 0;
  static var _focusNode = new FocusNode();
  GlobalKey<FormState> _key = new GlobalKey();
//  GlobalKey<>
  static ReportForm _reportForm = new ReportForm();
  String page,problem;

  List <DropdownMenuItem<String>> pages =[
    new DropdownMenuItem(
      child: new Text('Welcome'),
      value: 'Welcome',
      ),
    new DropdownMenuItem(
      child: new Text('Home'),
      value: 'Home',
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


//  List<Step> steps = [
//    new Step(
//      title: const Text('Page'),
//      //subtitle: const Text('Enter your name'),
//      isActive: true,
//      //state: StepState.error,
//      state: StepState.indexed,
//      content: new DropdownButtonHideUnderline(
//          child: DropdownButton(items: [
//        new DropdownMenuItem(
//          child: new Text('Welcome'),
//          value: 'Welcome',
//        ),
//        new DropdownMenuItem(
//          child: new Text('Home'),
//          value: 'Home',
//        ),
//      ], onChanged: (String val) {
//            setState(() {
//              page = val;
//            });
//          },)),
//    ),
//    new Step(
//        title: const Text('Problem'),
//        //subtitle: const Text('Subtitle'),
//        isActive: true,
//        //state: StepState.editing,
//        state: StepState.indexed,
//        content: new TextFormField(
//          keyboardType: TextInputType.text,
//          autocorrect: false,
//          validator: (input) {
//            if (input.isEmpty || input.length < 10) {
//              return 'Please enter valid text';
//            }
//          },
//          onSaved: (String value) {
//            _reportForm.problem = value;
//          },
//          maxLines: 1,
//          decoration: new InputDecoration(
//              labelText: 'Enter your number',
//              hintText: 'Enter a number',
//              icon: const Icon(Icons.phone),
//              labelStyle:
//                  new TextStyle(decorationStyle: TextDecorationStyle.solid)),
//        )),
//  ];

  @override
  Widget build(BuildContext context) {
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold.of(context)
          .showSnackBar(new SnackBar(content: new Text(message)));
    }

    void _submitDetails() {
      final FormState formState = _key.currentState;

      if (!formState.validate()) {
        showSnackBarMessage('Please enter correct data');
      } else {
        formState.save();
        print("Page: ${_reportForm.problemPage}");
        print("Problem: ${_reportForm.problem}");

        showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text("Details"),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text("Page: " + _reportForm.problemPage),
                  new Text("Problem:" + _reportForm.problem),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Confirm'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    }

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
        key: _key,
        child: new ListView(children: <Widget>[
          new Stepper(
            type: StepperType.vertical,
            currentStep: this.currStep,
            onStepContinue: () {
              setState(() {
                if (currStep < 1) {
                  currStep = currStep + 1;
                } else {
                  currStep = 0;
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (currStep > 0) {
                  currStep = currStep - 1;
                } else {
                  currStep = 0;
                }
              });
            },
            onStepTapped: (step) {
              setState(() {
                currStep = step;
              });
            },
            steps: <Step>[
              new Step(
                title: const Text('Page'),
                //subtitle: const Text('Enter your name'),
                isActive: true,
                //state: StepState.error,
                state: StepState.indexed,
                content: new DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: page,
                      items: pages, onChanged: (String val) {
                      setState(() {
                        page = val;
                      });
                    },)),
                ),
              new Step(
                  title: const Text('Problem'),
                  //subtitle: const Text('Subtitle'),
                  isActive: true,
                  //state: StepState.editing,
                  state: StepState.indexed,
                  content: new TextFormField(
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    validator: (input) {
                      if (input.isEmpty || input.length < 10) {
                        return 'Please enter valid text';
                      }
                    },
                    onSaved: (String value) {
                      problem = value;
                    },
                    maxLines: 1,
                    decoration: new InputDecoration(
                        labelText: 'Enter your number',
                        hintText: 'Enter a number',
                        icon: const Icon(Icons.phone),
                        labelStyle:
                        new TextStyle(decorationStyle: TextDecorationStyle.solid)),
                    )),
            ],
          ),
          new RaisedButton(
            child: new Text(
              'Save details',
              style: new TextStyle(color: Colors.white),
            ),
            onPressed: _submitDetails,
            color: Colors.blue,
          ),
        ]),
      )),
    );
  }
}

class ReportForm {
  String problemPage ='';
  String problem = '';
}
