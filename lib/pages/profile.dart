import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brokerage_app/services/stock_data.dart';
import 'package:pie_chart/pie_chart.dart';

class ForPie{
  String ticker;
  double percent;

  ForPie({this.ticker, this.percent});
}


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {

    Map fullStanck = ModalRoute.of(context).settings.arguments;
    List<StockData> stockList = fullStanck['data'];//as a list
    double total = fullStanck['tot'];//as a list
    double cash = fullStanck['cash'];

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
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Perhaps multiple pages, this being just one of them'),
                ),
                Text('Worth = \$$ressult',
                textScaleFactor: 2,
               ),
                SizedBox(height: 50),

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
