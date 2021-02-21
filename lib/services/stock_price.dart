import 'package:finance_quote/finance_quote.dart';

class StockPrice{
  String tickerInternal;
  String priceInternal;
  String tickerInternal2;
  String priceInternal2;
  String tickerInternal3;
  String priceInternal3;
  String tickerInternal4;
  String priceInternal4;
  String tickerInternal5;
  String priceInternal5;
  String tickerInternal6;
  String priceInternal6;
  String tickerInternal7;
  String priceInternal7;
  String tickerInternal8;
  String priceInternal8;
  String tickerInternal9;
  String priceInternal9;


  StockPrice({ this.tickerInternal, this.tickerInternal2, this.tickerInternal3, this.tickerInternal4, this.tickerInternal5, this.tickerInternal6, this.tickerInternal7, this.tickerInternal8, this.tickerInternal9});

  Future<void> getP() async {

      Map<String, Map<String, String>> quotePrice = await FinanceQuote.getPrice(
          quoteProvider: QuoteProvider.yahoo, symbols: <String>['$tickerInternal', '$tickerInternal2', '$tickerInternal3', '$tickerInternal4', '$tickerInternal5', '$tickerInternal6', '$tickerInternal7', '$tickerInternal8', '$tickerInternal9']);// add the '$ticherinternal#'
      String priceInter = quotePrice['$tickerInternal']['price'].toString();// get rid of await or something?
      String priceInter2 = quotePrice['$tickerInternal2']['price'].toString();// get rid of await or something?//coppy this line
      String priceInter3 = quotePrice['$tickerInternal3']['price'].toString();// get rid of await or something?//coppy this line
      String priceInter4 = quotePrice['$tickerInternal4']['price'].toString();// get rid of await or something?//coppy this line
      String priceInter5 = quotePrice['$tickerInternal5']['price'].toString();// get rid of await or something?//coppy this line
      String priceInter6 = quotePrice['$tickerInternal6']['price'].toString();// get rid of await or something?//coppy this line
      String priceInter7 = quotePrice['$tickerInternal7']['price'].toString();// get rid of await or something?//coppy this line
      String priceInter8 = quotePrice['$tickerInternal8']['price'].toString();// get rid of await or something?//coppy this line
      String priceInter9 = quotePrice['$tickerInternal9']['price'].toString();// get rid of await or something?//coppy this line

      priceInternal = priceInter;
      priceInternal2 = priceInter2; //copy this line
      priceInternal3 = priceInter3;
      priceInternal4 = priceInter4;
      priceInternal5 = priceInter5;
      priceInternal6 = priceInter6;
      priceInternal7 = priceInter7;
      priceInternal8 = priceInter8;
      priceInternal9 = priceInter9;
  }


}