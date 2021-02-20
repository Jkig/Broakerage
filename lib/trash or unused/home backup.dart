import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:finance_quote/finance_quote.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int accountNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buying Power: \$XX,XXX'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],

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
                    onPressed: (){
                      accountNumber = 0;
                    },

                    //if (accountNumber == 0) {color: Colors.blueGrey[100];}else{color: Colors.blue[600];}
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
                    onPressed: (){
                      accountNumber = 1;
                    },
                    color: Colors.blueGrey[100],
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
                    Text('Total Value: \$XXX,XXX',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Text('Total Gain: \$XX,XXX',
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),


            //Image.asset('assets/sample_graph.png'),
            Image.asset('assets/prices1.png', height: 250.0, width: 370, ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                RaisedButton(
                  onPressed: (){},
                  color: Colors.grey[100],
                  child: Text('day'),
                  padding: EdgeInsets.all(9.0),
                  shape: CircleBorder(),
                ),
                RaisedButton(
                  onPressed: (){},
                  color: Colors.blueGrey[100],
                  child: Text('1 W'),
                  padding: EdgeInsets.all(9.0),
                  shape: CircleBorder(),
                ),
                RaisedButton(
                  onPressed: (){},
                  color: Colors.blueGrey[100],
                  child: Text('1 M'),
                  padding: EdgeInsets.all(9.0),
                  shape: CircleBorder(),
                ),
                RaisedButton(
                  onPressed: (){},
                  color: Colors.blueGrey[100],
                  child: Text('3 M'),
                  padding: EdgeInsets.all(9.0),
                  shape: CircleBorder(),
                ),
              ],

            ),

            SizedBox(height: 10.0,),

            const Divider(
              color: Colors.grey,
              height: 10,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            const Divider(
              color: Colors.grey,
              height: 10,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(height: 10.0),

            _buildPreview(context, 'AAPL','800'),
            _buildPreview(context, 'TSLA','800'),
            _buildPreview(context, 'GOOGL','1747'),
            _buildPreview(context, 'SPY','380'),
            _buildPreview(context, 'TWTR','47.29'),
            _buildPreview(context, 'DBX','22.21'),
            _buildPreview(context, 'FB','252'),
            _buildPreview(context, 'AMZN','3165'),
            _buildPreview(context, 'PLTR','25.45'),






          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey[200],
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

    );
  }
}

//function that takes in ticker and returns price
//probably returns price as a future, turn to string in card builder
//or into string as a
Future<String> finder(String ticker) async {
  final Map<String, Map<String, String>> quotePrice =
  await FinanceQuote.getPrice(
      quoteProvider: QuoteProvider.yahoo, symbols: <String>['$ticker']);
  print("${quotePrice['$ticker']['price']}");
  return '${quotePrice['$ticker']['price']}';
}


Widget _buildPreview (context, String name, String price) {

  Random random = new Random();
  int randomNumber = random.nextInt(3);
  randomNumber +=1;
  //print('$random');

  return
    GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,'/full_stock', arguments: { 'name': name,});
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
        color: Colors.grey[30],
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 30,),

            Text(
              '$name',
              style: TextStyle(
                fontFamily: 'pacifico',
                fontSize: 25.0,
              ),
            ),

            SizedBox(width: 59,),

            Container(
              height: 80.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage('assets/prices$randomNumber.png'), fit: BoxFit.fitHeight)
              ),
            ),

            SizedBox(width: 59,),

            Text(
              "$price",
              style: TextStyle(
                fontFamily: 'pacifico',
                fontSize: 25.0,
              ),

            ),

            SizedBox(width: 30.0,)
          ],
        ),
      ),
    );
}