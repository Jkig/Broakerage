import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(//// get rid of appBar because we are places?
        title: Text('Help'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: Text("wow"),
    );
  }
}
