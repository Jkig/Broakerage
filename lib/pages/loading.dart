import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brokerage_app/services/stock_price.dart';
import 'package:brokerage_app/services/stock_data.dart';
import 'package:brokerage_app/services/coin_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:brokerage_app/services/globals.dart' as globals;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Stock{
  String tickerGoesHere = '';
  String priceGoesHere = '';
}


//fileio shit
class CounterStorage {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }


  //get file (try with globals test:)
  Future<File> get _localFile async {
    final path = await _localPath;
    //return File('globals_test.dart');
    return File('$path/counterCash.txt');
  }
//read current counter
  Future<double> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return double.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }
//write current counter
  Future<File> writeCounter(double counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupPrice( String name1, String name2, String name3, String name4, String name5, String name6, String name7, String name8, String name9, String cname1, String cname2, String cname3) async {
    /*
    File file = File('/services/store.txt');
    String quantityAsString = await file.readAsString();
    Map quant1 = json.decode(quantityAsString);
    */
    CounterStorage b = CounterStorage();
    double deltaCash = await b.readCounter();

    Map quant1 = globals.quant1;//{'cash' : 11123.0 ,'AAPL' : 0.00, 'TSLA' : 0.0, 'GOOGL' : 3.0, 'SPY' : 0.0, 'INTC' : 2.0, 'DBX' : 0.0, 'FB' : 0.0, 'AMZN' : 0.0, 'PLTR' : 0.0, 'bitcoin' : 1.5 ,'ethereum' : 9.0, 'polkadot' : 375.4666};
    //Map quant2 = {'bitcoin' : 1.5 ,'ethereum' : 9.0, 'polkadot' : 375.4666};
      StockPrice aapl = StockPrice(tickerInternal: "$name1", tickerInternal2: "$name2", tickerInternal3: "$name3", tickerInternal4: "$name4", tickerInternal5: "$name5", tickerInternal6: "$name6", tickerInternal7: "$name7", tickerInternal8: "$name8", tickerInternal9: "$name9");//add this one here
      await aapl.getP();
      CoinData coinsMap = CoinData(tickerInternal: "$cname1", tickerInternal2: "$cname2", tickerInternal3: "$cname3");// failuire in here
      await coinsMap.getP();
      // here take this object, loop through and make a map of singleStock options
      StockData s1 = StockData(tickerInternal: aapl.tickerInternal, priceInternal: aapl.priceInternal, quant: quant1[aapl.tickerInternal]);
      StockData s2 = StockData(tickerInternal: aapl.tickerInternal2, priceInternal: aapl.priceInternal2, quant: quant1[aapl.tickerInternal2]);
      StockData s3 = StockData(tickerInternal: aapl.tickerInternal3, priceInternal: aapl.priceInternal3, quant: quant1[aapl.tickerInternal3]);
      StockData s4 = StockData(tickerInternal: aapl.tickerInternal4, priceInternal: aapl.priceInternal4, quant: quant1[aapl.tickerInternal4]);
      StockData s5 = StockData(tickerInternal: aapl.tickerInternal5, priceInternal: aapl.priceInternal5, quant: quant1[aapl.tickerInternal5]);
      StockData s6 = StockData(tickerInternal: aapl.tickerInternal6, priceInternal: aapl.priceInternal6, quant: quant1[aapl.tickerInternal6]);
      StockData s7 = StockData(tickerInternal: aapl.tickerInternal7, priceInternal: aapl.priceInternal7, quant: quant1[aapl.tickerInternal7]);
      StockData s8 = StockData(tickerInternal: aapl.tickerInternal8, priceInternal: aapl.priceInternal8, quant: quant1[aapl.tickerInternal8]);
      StockData s9 = StockData(tickerInternal: aapl.tickerInternal9, priceInternal: aapl.priceInternal9, quant: quant1[aapl.tickerInternal9]);
      StockData s10 = StockData(tickerInternal: coinsMap.tickerInternal, priceInternal: coinsMap.priceInternal, quant: quant1[coinsMap.tickerInternal]);
      StockData s11 = StockData(tickerInternal: coinsMap.tickerInternal2, priceInternal: coinsMap.priceInternal2, quant: quant1[coinsMap.tickerInternal2]);
      StockData s12 = StockData(tickerInternal: coinsMap.tickerInternal3, priceInternal: coinsMap.priceInternal3, quant: quant1[coinsMap.tickerInternal3]);

      List<StockData> stockList = [ s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12];
      double cashQuant = quant1['cash'];
      cashQuant += deltaCash;
      globals.stocks = stockList;
      globals.cash = cashQuant;

      //Navigator.pushReplacementNamed(context,'/home', arguments: { 'aapl': aapl, 'quant' : quant1});// as a single object
      //Navigator.pushReplacementNamed(context,'/home', arguments: { 'list': stockList, 'cash': cashQuant});// as a list of StockData objects
      //commenting above and adding below only adds bottomnavbar
      Navigator.pushReplacementNamed(context,'/shell', );//arguments: { 'list': stockList, 'cash': cashQuant});// as a list of StockData objects

  }


  @override


//Map import = ModalRoute.of(context).settings.arguments;
//Map quantity = {'cash' : 10000 ,'AAPL' : 0, 'TSLA' : 0, 'GOOGL' : 3, 'SPY' : 0, 'TWTR' : 0, 'DBX' : 0, 'FB' : 0, 'AMZN' : 0, 'PLTR' : 0};


  void initState() {
    super.initState();
    setupPrice('AAPL', 'NVDA', 'GOOGL', 'SNOW', 'AMD', 'AI', 'FB', 'AMZN', 'PLTR', 'bitcoin','ethereum', 'polkadot');
    //setupPrice('AAPL', 'TSLA', 'GOOGL', 'SPY', 'TWTR', 'DBX', 'FB', 'AMZN', 'PLTR', 'bitcoin','ethereum', 'polkadot');


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 75.0,
          ),
      ),

    );
  }
}
