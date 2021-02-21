import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(//// get rid of appBar because we are places?
        title: Text('Settings'),
    centerTitle: true,
    backgroundColor: Colors.blue[600],
    ),
    body: Text("wow"),
    );
  }
}
