import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:brokerage_app/services/globals.dart' as globals;

class FullStock extends StatefulWidget {
  @override
  _FullStockState createState() => _FullStockState();
}

class _FullStockState extends State<FullStock> {

  Map ticker;
  String tickerAsString;
  String priceAsString;

  int counter = 0;

  @override
  Widget build(BuildContext context) {

    double numbShares = 0;

    Map fullStanck = ModalRoute.of(context).settings.arguments;
    tickerAsString =  fullStanck['name'];
    priceAsString =  fullStanck['price'];
    double fullQuant = fullStanck['quant'];
    numbShares += fullQuant;// how to run this only once to initialise n shiot
    //var numbShares = fullQuant;// set something =this later, to kinda 'step it down'
    numbShares += counter;


    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';
    String ressult = priceAsString.replaceAllMapped(reg, mathFunc);
    String equit = (numbShares*double.parse(priceAsString)).toStringAsFixed(2);
    String equity1 = equit.replaceAllMapped(reg, mathFunc);


    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back,),
            onPressed: () => Navigator.pop(context),
            //onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('$tickerAsString' + ':    \$$ressult'),
          centerTitle: true,
          backgroundColor: Colors.blue[700],

        ),

        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset('assets/prices1.png', height: 250.0, width: 370,),
              Text('Here I have info about the stock'),
              SizedBox(height: 125.0),
              Text('Equity: \$$equity1'),
              SizedBox(height: 125.0),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              ButtonTheme(
                minWidth: 90.0,
                height: 45.0,
                child: RaisedButton(
                  onPressed: (){
                    setState(() {
                      //counter++;
                    });
                    //to trade page
                    Navigator.pushNamed(context,'/trade', arguments: { 'bs': 1, 'name': tickerAsString, 'price': priceAsString});
                  },

                  //if (accountNumber == 0) {color: Colors.blueGrey[100];}else{color: Colors.blue[600];}
                  color: Colors.blue[600],

                  child: Text('Buy'),
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
                minWidth: 90.0,
                height: 45.0,
                child: RaisedButton(
                  onPressed: (){
                    setState(() {
                      //counter--;
                    });
                    Navigator.pushNamed(context,'/trade', arguments: { 'bs': 0, 'name': tickerAsString, 'price': priceAsString});
                  },
                  color: Theme.of(context).accentColor,
                  child: Text('Sell'),
                  padding: EdgeInsets.all(4.0),
                  //shape: CircleBorder(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
              ),

            ],
          ),
          //add shares
          Text('You have $numbShares Shares of $tickerAsString')

          ],
        )
        )
    );
  }
}
