// takes in stock name, price, quantitty to be bought or sold, and has a sliding action to confirm
// updates the cash value and the stock quantity
//pushed back to loading(or main if can)
//spinner for short time...

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loading.dart';
import 'package:brokerage_app/services/globals.dart' as globals;

class TradeConfirm extends StatefulWidget {
  @override
  _TradeConfirmState createState() => _TradeConfirmState();
}

class _TradeConfirmState extends State<TradeConfirm> {
  double quantity = 0;
  double price;
  double total;
  String name;
  double quantityChange;

  @override
  Widget build(BuildContext context) {
    Map fullStanck = ModalRoute.of(context).settings.arguments;
    quantity =  fullStanck['quantity'];
    price = double.parse(fullStanck['price']);
    name = fullStanck['name'];
    total = price*quantity;
    quantityChange = quantity;
    if(fullStanck['bs'] == 0){
      total = -total;
      quantityChange = -quantityChange;
    }

    return Scaffold(
      appBar: AppBar(
          title: Text('Confirm Trade for ${fullStanck['name']}'),
          centerTitle: true,
          backgroundColor: Colors.blue[700]
      ),

      body: Center(
        child: Column(

          children: <Widget>[
            //make sure to animate this page in
            SizedBox(height: 42.0),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('Do you want to trade $quantity Shares for \$$price a share, for a total of \$$total'),
            ),
            Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonTheme(
                      minWidth: 120.0,
                      height: 45.0,
                      child: RaisedButton(
                        onPressed: (){
                          setState(() {
                            globals.quant1['cash'] -= total;
                            globals.quant1['$name'] += quantityChange;
                          });


                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Loading()),
                                (Route<dynamic> route) => false,
                          );

                        },
                        color: Colors.blue[600],
                        child: Text('Yes'),
                        padding: EdgeInsets.all(4.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                    ),

                    SizedBox(width: 8.0),

                    ButtonTheme(
                      minWidth: 120.0,
                      height: 45.0,
                      child: RaisedButton(
                        onPressed: (){
                          setState(() {

                          });
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Loading()),
                                (Route<dynamic> route) => false,
                          );
                        },
                        color: Colors.blue[600],
                        child: Text('No'),
                        padding: EdgeInsets.all(4.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

          ],
        ),
      ),
    );
  }
}
