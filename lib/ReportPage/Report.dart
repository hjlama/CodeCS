import 'package:ccs/ReportPage/ReportStepper.dart';
import 'package:flutter/material.dart';
class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Report page', style: Theme.of(context).textTheme.title,),
        centerTitle: true,
        ),
      body: ReportStepper(),
    );
  }
}
