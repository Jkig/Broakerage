import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/full_stock.dart';
import 'pages/loading.dart';
import 'pages/change_cash.dart';
import 'pages/change_cash_submit.dart';
import 'pages/profile.dart';
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

      '/shell':(context) => Shell(),// this will call the three main guys into the body
      //only other interuption here should be that the loading calls this,
      // with this calling other parts,?? I think this should work

      '/home': (context) => Home(),
      '/full_stock': (context) => FullStock(),
      '/change_cash': (context) => ChangeCash(),
      '/change_cash_submit': (context) => ChangeCashSumbit(),
      '/profile': (context) => Profile(),
      '/search': (context) => Search(),
      '/trade': (context) => Trade(),//make widgets
      '/trade_confirm': (context) => TradeConfirm(),//make widgets

      //add counters here? to work better?
    },

  ));
}