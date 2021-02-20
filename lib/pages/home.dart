import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:brokerage_app/services/stock_data.dart';
import 'package:brokerage_app/services/globals.dart' as globals;
//import 'search.dart';
//import 'profile.dart';
//import 'package:brokerage_app/services/my_bott_nav.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

  class _HomeState extends State<Home> {



    @override
    Widget build(BuildContext context) {

      Map fullStanck = ModalRoute
          .of(context)
          .settings
          .arguments;

      double cashval = fullStanck['cash'];

      List<StockData> stockList = fullStanck['list']; //as a list


      for (var j = 0; j < 12; j++) { // I hard coded in 12 here, don't lol
        stockList[j].quant = globals.quant1['${stockList[j].tickerInternal}'];
      }

      double totalVal = 0;
      totalVal += cashval; // get this ready

      for (var i = 0; i < 12; i++) {
        totalVal +=
            stockList[i].quant * double.parse(stockList[i].priceInternal);
      }
      String totVround = totalVal.toStringAsFixed(2);

      RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
      Function mathFunc = (Match match) => '${match[1]},';
      String ressult = totVround.replaceAllMapped(reg, mathFunc);
      String cashValBetter = cashval.toStringAsFixed(2);
      cashValBetter = cashValBetter.replaceAllMapped(reg, mathFunc);


      return Scaffold(

        appBar: AppBar(
          title: Text('Buying Power    \$$cashValBetter'),
          centerTitle: true,
          backgroundColor: Colors.blue[700],
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/change_cash',
                        arguments: { 'current': cashval}); // remove stocklist
                  },
                  child: Icon(
                      Icons.add_rounded
                  ),
                )
            ),
          ],
        ),

        body: SingleChildScrollView(

          child: Column(

            //margin: EdgeInsets.all(10.0),
            children: <Widget>[
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  ButtonTheme(
                    minWidth: 50.0,
                    height: 25.0,

                    child: RaisedButton(

                      onPressed: () {
                        setState(() {
                          //accountNumber = false;
                        });
                      },

                      //if(accountNumber){color: Colors.blueGrey[100];}else{color: Colors.blue[600];}

                      color: Colors.blue[600],
                      child: Text('IRA'),
                      padding: EdgeInsets.all(4.0),
                      //shape: CircleBorder(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 25.0,
                  ),

                  ButtonTheme(
                    minWidth: 50.0,
                    height: 25.0,
                    child: RaisedButton(
                      onPressed: () {
                        //accountNumber = 1;
                      },
                      color: Theme
                          .of(context)
                          .accentColor,
                      child: Text('Indiv'),
                      padding: EdgeInsets.all(4.0),
                      //shape: CircleBorder(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 25.0,
                  ),

                  Column(
                    children: <Widget>[
                      Text('Value: \$$ressult',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      /*
                          Text('Total Gain: \$XX,XXX',
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),

                         */
                    ],
                  ),
                ],
              ),


              //Image.asset('assets/sample_graph.png'),
              Image.asset('assets/prices1.png', height: 250.0, width: 370,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  RaisedButton(
                    onPressed: () {},
                    color: Theme
                        .of(context)
                        .accentColor,
                    child: Text('day'),
                    padding: EdgeInsets.all(9.0),
                    shape: CircleBorder(),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Theme
                        .of(context)
                        .accentColor,
                    child: Text('1 W'),
                    padding: EdgeInsets.all(9.0),
                    shape: CircleBorder(),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Theme
                        .of(context)
                        .accentColor,
                    child: Text('1 M'),
                    padding: EdgeInsets.all(9.0),
                    shape: CircleBorder(),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Theme
                        .of(context)
                        .accentColor,
                    child: Text('3 M'),
                    padding: EdgeInsets.all(9.0),
                    shape: CircleBorder(),
                  ),
                ],

              ),

              SizedBox(height: 10.0,),

              /*
                    const Divider(
                      color: Colors.grey,
                      height: 10,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                    */

              const Divider(
                color: Colors.grey,
                height: 10,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(height: 10.0),


              _buildPreview(context, stockList[ 0 ].tickerInternal,
                  stockList[ 0 ].priceInternal, globals.quant1['AAPL']),
              _buildPreview(context, stockList[ 1 ].tickerInternal,
                  stockList[ 1 ].priceInternal, stockList[ 1 ].quant),
              _buildPreview(context, stockList[ 2 ].tickerInternal,
                  stockList[ 2 ].priceInternal, stockList[ 2 ].quant),
              _buildPreview(context, stockList[ 3 ].tickerInternal,
                  stockList[ 3 ].priceInternal, stockList[ 3 ].quant),
              _buildPreview(context, stockList[ 4 ].tickerInternal,
                  stockList[ 4 ].priceInternal, stockList[ 4 ].quant),
              _buildPreview(context, stockList[ 5 ].tickerInternal,
                  stockList[ 5 ].priceInternal, stockList[ 5 ].quant),
              _buildPreview(context, stockList[ 6 ].tickerInternal,
                  stockList[ 6 ].priceInternal, stockList[ 6 ].quant),
              _buildPreview(context, stockList[ 7 ].tickerInternal,
                  stockList[ 7 ].priceInternal, stockList[ 7 ].quant),
              _buildPreview(context, stockList[ 8 ].tickerInternal,
                  stockList[ 8 ].priceInternal, stockList[ 8 ].quant),
              _buildPreview(context, stockList[ 9 ].tickerInternal,
                  double.parse(stockList[ 9 ].priceInternal).toStringAsFixed(2),
                  stockList[ 9 ].quant),
              _buildPreview(context, stockList[ 10 ].tickerInternal,
                  double.parse(stockList[ 10 ].priceInternal).toStringAsFixed(
                      2), stockList[ 10 ].quant),
              _buildPreview(context, stockList[ 11 ].tickerInternal,
                  double.parse(stockList[ 11 ].priceInternal).toStringAsFixed(
                      2), stockList[ 11 ].quant),


              SizedBox(height: 10.0),
              //test to profile

              Row(
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/search', arguments: {
                        'data': stockList,
                        'tot': totalVal,
                        'cash': cashval
                      });
                    },
                    color: Colors.blueGrey[600],
                    child: Text('Search'),
                    padding: EdgeInsets.all(29.0),
                    shape: CircleBorder(),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile', arguments: {
                        'data': stockList,
                        'tot': totalVal,
                        'cash': cashval
                      });
                    },
                    color: Colors.blueGrey[600],
                    child: Text('test profile'),
                    padding: EdgeInsets.all(29.0),
                    shape: CircleBorder(),
                  ),

                ],
              ),

              SizedBox(height: 10.0),

            ],
          ),
        ),
      );
    }
  }

Widget _buildPreview (context, String name, String price, double quant) {

  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  Random random = new Random();
  int randomNumber = random.nextInt(3);
  String name1 = name;
  randomNumber +=1;
  double quantity = quant;//quant['$name'];
  //print('$random');
  double whole = double.parse('$price');
  String printable = whole.toStringAsFixed(2);
  if ( '$name' == 'polkadot'){
    name1 = 'DOT';
  }
  if ( '$name' == 'bitcoin'){
    name1 = 'BTC';
  }
  if ( '$name' == 'ethereum'){
    name1 = 'ETH';
  }


  return
    GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,'/full_stock', arguments: { 'name': name, 'price': price, 'quant': quant});
      },

      child: Card(
        margin: EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
        color: Colors.grey[30],
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 30,),

            Text(
              '$name1',
              style: TextStyle(
                fontFamily: 'pacifico',
                fontSize: 23.0,
              ),
            ),
            Text(
              '(${quantity.toStringAsFixed(1)})',
              style: TextStyle(
                fontFamily: 'pacifico',
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),

            SizedBox(width: 21,),

            Container(
              height: 80.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //color: Colors.white,
                  image: DecorationImage(image: AssetImage('assets/prices$randomNumber.png'), fit: BoxFit.fitHeight)
              ),
            ),

            SizedBox(width: 25,),

            Text(
              "${printable.replaceAllMapped(reg, mathFunc)}",
              style: TextStyle(
                fontFamily: 'pacifico',
                fontSize: 23.0,
              ),

            ),

            SizedBox(width: 30.0,)
          ],
        ),
      ),
    );
}


