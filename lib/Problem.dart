import 'package:flutter/material.dart';

class Problem extends StatefulWidget {
  @override
  _ProblemState createState() => new _ProblemState();
}

class _ProblemState extends State<Problem> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'App',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Report')),
        body: new Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepTapped: (int step) => setState(() => _currentStep = step),
          onStepContinue: _currentStep < 2 ? () => setState(() => _currentStep += 1) : null,
          onStepCancel: _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
          steps: <Step>[
            new Step(
              title: new Text('Shipping'),
              content: new Text('This is the first step.'),
              isActive: _currentStep >= 0,
              state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
              ),
            new Step(
              title: new Text('Payment'),
              content: new Text('This is the second step.'),
              isActive: _currentStep >= 0,
              state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
            new Step(
              title: new Text('Order'),
              content: new Text('This is the third step.'),
              isActive: _currentStep >= 0,
              state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
          ],
          ),
        ),
      );
  }
}