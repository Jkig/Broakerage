import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brokerage_app/services/stock_data.dart';
import 'package:brokerage_app/services/globals.dart' as globals;
import 'package:pie_chart/pie_chart.dart';

class ForPie{
  String ticker;
  double percent;

  ForPie({this.ticker, this.percent});
}


class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {

  @override
  Widget build(BuildContext context) {


    /*
    Map fullStanck = ModalRoute.of(context).settings.arguments;
    List<StockData> stockList = fullStanck['data'];//as a list
    double total = fullStanck['tot'];//as a list
    double cash = fullStanck['cash'];
     */
    //here i'll pull the prices and etc out of the global var.
    List<StockData> stockList = globals.stocks;//as a list
    double total = globals.total;//as a list
    double cash = globals.cash;


    String totAsString = total.toStringAsFixed(2);
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';
    String ressult = totAsString.replaceAllMapped(reg, mathFunc);

    ForPie cashObj = ForPie(ticker: 'Cash', percent: cash/total);
    List<ForPie> listForPie = [cashObj];

    for(var i = 0; i < 12; i++) {
      double intermediate = 0;
      intermediate = stockList[i].quant*double.parse(stockList[i].priceInternal);
      if(intermediate == 0) {//excludes 0 values!!
        continue;
      }
      double percent = intermediate/total;

      listForPie.add(ForPie(ticker: '${stockList[i].tickerInternal}', percent: percent));//(ticker: '${stockList[i].tickerInternal}', percent: intermediate)
    }

    Map<String, double> map2 = {};
    listForPie.forEach((forPie) => map2[forPie.ticker] = forPie.percent);

    return Scaffold(
        appBar: AppBar(//// get rid of appBar because we are places?
          title: Text('Profile'),
          centerTitle: true,
          backgroundColor: Colors.blue[600],
        ),

        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 25.0),
                Text('Total Value = \$$ressult',
                  textScaleFactor: 1.5,
                ),
                SizedBox(height: 25),

                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.750,
                    child: PieChart(
                      dataMap: map2,
                      initialAngleInDegree: 270,

                      legendOptions: LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.bottom,
                        showLegends: true,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }
}