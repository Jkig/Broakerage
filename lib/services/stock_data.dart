//import 'package:flutter/material.dart';

class StockData{
  String tickerInternal;
  String priceInternal;
  double quant;

  StockData({ this.tickerInternal, this.priceInternal, this.quant});
}



/*





  double whole = double.parse('$priceInternal');
  String printable = whole.toStringAsFixed(2);

  @override//?

  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';



  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,'/full_stock', arguments: { 'name': tickerInternal, 'price': priceInternal, 'quant': quant});
      },

      child: Card(
        margin: EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
        color: Colors.grey[30],
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 30,),

            Text(
              '$tickerInternal',
              style: TextStyle(
                fontFamily: 'pacifico',
                fontSize: 23.0,
              ),
            ),
            Text(
              '(${quant.toStringAsFixed(1)})',
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
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage('assets/prices2.png'), fit: BoxFit.fitHeight)
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






 */