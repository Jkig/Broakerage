import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/full_stock.dart';
import 'pages/loading.dart';
import 'pages/change_cash.dart';
import 'pages/profile.dart';
import 'pages/search.dart';
//import 'services/globals.dart' as globals;

void main() async {

  runApp(MaterialApp(
    //home: Home(),
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue[800],
      accentColor: Colors.cyan[600],
      ),

    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/full_stock': (context) => FullStock(),
      '/change_cash': (context) => ChangeCash(),
      '/profile': (context) => Profile(),
      '/search': (context) => Search(),
    },
  ));
}