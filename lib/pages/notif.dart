import 'package:flutter/material.dart';

class Notif extends StatefulWidget {
  @override
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(//// get rid of appBar because we are places?
        title: Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: Text("wow"),
    );
  }
}
