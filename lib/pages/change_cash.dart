import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
import 'package:brokerage_app/services/stock_data.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:brokerage_app/pages/globals_test.dart' as globals;// don't change this yet?, or use this as this as the path?
*/

class ChangeCash extends StatefulWidget {
  @override
  _ChangeCash createState() => _ChangeCash();
}

class _ChangeCash extends State<ChangeCash> {

  double cash;
  double result = 0;
  //final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {


    Map fullStanck = ModalRoute.of(context).settings.arguments;
    cash =  fullStanck['current'];
    //List<StockData> stockList = fullStanck['list'];//as a list
    //double cashQ = cash;

    String ressult = cash.toStringAsFixed(2);
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';
    String cashValBetter = double.parse(ressult).toStringAsFixed(2);
    ressult = cashValBetter.toString().replaceAllMapped(reg, mathFunc);




    return Scaffold(
        appBar: AppBar(
          title: Text('Cash:     \$$ressult'),
          centerTitle: true,
          backgroundColor: Colors.blue[700],
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
                            hintText: '   \$ Amount',
                          ),
                          onSubmitted: (String str) {
                            setState(() {
                              result = double.parse(str);
                              //Navigator.pushNamed(context, '/change_cash_submit', arguments: { 'delt': result});
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
                    Navigator.pushNamed(context, '/change_cash_submit', arguments: { 'delta': result});
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