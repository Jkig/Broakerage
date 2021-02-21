import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/full_stock.dart';
import 'pages/loading.dart';
import 'pages/change_cash.dart';
import 'pages/change_cash_submit.dart';
import 'pages/profile.dart';
import 'pages/portfolio.dart';
import 'pages/settings.dart';
import 'pages/help.dart';
import 'pages/notif.dart';
import 'pages/search.dart';
import 'pages/trade.dart';
import 'pages/trade_confirm.dart';

import 'pages/shell.dart';

//import 'services/globals.dart' as globals;

void main() async {

  runApp(MaterialApp(
    //home: Home(),
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue[800],
      accentColor: Colors.cyan[600],
      ),

//here i put the nav bar, where the body: calls to the different shits...

    routes: {
      '/': (context) => Loading(),

      '/shell':(context) => Shell(),
      '/home': (context) => Home(),
      '/full_stock': (context) => FullStock(),
      '/change_cash': (context) => ChangeCash(),
      '/change_cash_submit': (context) => ChangeCashSumbit(),
      '/search': (context) => Search(),
      '/trade': (context) => Trade(),//make widgets
      '/trade_confirm': (context) => TradeConfirm(),//make widgets
      '/profile': (context) => Profile(),
      '/portfolio': (context) => Portfolio(),
      '/settings': (context) => Settings(),
      '/help': (context) => Help(),
      '/notif': (context) => Notif(),


    },

  ));
}