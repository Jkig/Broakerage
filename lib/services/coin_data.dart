import 'package:finance_quote/finance_quote.dart';

class CoinData{
  String tickerInternal;//btc
  String priceInternal;
  String tickerInternal2;//eth
  String priceInternal2;
  String tickerInternal3;//dot
  String priceInternal3;



  CoinData({ this.tickerInternal, this.tickerInternal2, this.tickerInternal3});

  Future<void> getP() async {

    Map<String, Map<String, dynamic>> quotePrice = await FinanceQuote.getRawData(
        quoteProvider: QuoteProvider.coincap, symbols: <String>['$tickerInternal', '$tickerInternal2', '$tickerInternal3']);// add the '$ticherinternal#'//

    String priceInter = quotePrice['$tickerInternal']['priceUsd'].toString();// get rid of await or something?
    String priceInter2 = quotePrice['$tickerInternal2']['priceUsd'].toString();// get rid of await or something?//coppy this line
    String priceInter3 = quotePrice['$tickerInternal3']['priceUsd'].toString();// get rid of await or something?//coppy this line

    priceInternal = priceInter;
    priceInternal2 = priceInter2; //copy this line
    priceInternal3 = priceInter3;
  }
}