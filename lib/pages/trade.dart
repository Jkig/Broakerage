//get passed in price, stockname, and buy or sell
//here there is an input field
    //maybe a slider or drop down... (pretty)

//nice looking full bottom of screen buy (or sell given action)
//passes the quantiyu of x stock to be bought or sold to confirmation page

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Trade extends StatefulWidget {
  @override
  _TradeState createState() => _TradeState();
}

class _TradeState extends State<Trade> {


  double quantity = 0;
  @override
  Widget build(BuildContext context) {
    Map fullStanck = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Trade'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),

      body: Column(

        children: <Widget>[
          SizedBox(height: 50.0),

          Center(
            child: SizedBox(
              height: 40.0,
              width: 350.0,
              child: Card(
                color: Colors.grey[500],
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.0,0,0,0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '   Quantity',
                    ),
                    onSubmitted: (String str) {
                      setState(() {
                        quantity = double.parse(str);
                        //Navigator.pushNamed(context, '/change_cash_submit', arguments: { 'delta': result});
                      });
                    },
                    //controller: controller,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ),
          ),
          ButtonTheme(
            minWidth: 120.0,
            height: 45.0,
            child: RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/trade_confirm', arguments: { 'price': fullStanck['price'], 'bs': fullStanck['bs'],'quantity': quantity,'name': fullStanck['name']});
              },
              color: Colors.blue[600],
              child: Text('next'),
              padding: EdgeInsets.all(4.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
