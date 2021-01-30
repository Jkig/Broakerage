import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeCash extends StatefulWidget {
  @override
  _ChangeCash createState() => _ChangeCash();
}

class _ChangeCash extends State<ChangeCash> {

  double cash;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {


    Map fullStanck = ModalRoute.of(context).settings.arguments;
    cash =  fullStanck['current'];
    String result = '';

    return Scaffold(
        appBar: AppBar(
          title: Text('Cash:     \$$cash'),
          centerTitle: true,
          backgroundColor: Colors.blue[600],
          /*
          leading: IconButton(icon: Icon(Icons.arrow_back),// get a better icon
            //onPressed: () => Navigator.pushReplacementNamed(context, '/loading'),
            onPressed: () => Navigator.pushReplacementNamed(context, new MaterialPageRoute(
              builder: (context) => new Loading())
            ),
          ),

           */
        ),

        body: Column(

          children: <Widget>[
            SizedBox(height: 50.0),

              SizedBox(
              height: 40.0,
              width: 350.0,
                child: Card(
                color: Colors.grey[300],
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '   \$ Amount',
                      ),
                      onSubmitted: (String str) {
                        setState((){
                          result = str;
                          //Text('do you want to withdrawl or depostit $result');
                        });
                        controller.text = 'Withdrawl or Depostit $result';
                      },
                      controller: controller,
                      keyboardType: TextInputType.number,
                    ),
                ),
            ),

            SizedBox(
              height: 40.0,
              width: 100.0,
              child:Text('$result'),
              ),

            SizedBox(
              height: 12.5,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                ButtonTheme(
                  minWidth: 60.0,
                  height: 35.0,
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        //will hopefully work later
                        cash += int.parse(result);
                        // write to file now and go back?
                        //(context as Element).reassemble();
                      });
                    },

                    //if (accountNumber == 0) {color: Colors.blueGrey[100];}else{color: Colors.blue[600];}
                    color: Colors.blue[600],

                    child: Text('Deposit'),
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
                  minWidth: 60.0,
                  height: 35.0,
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        //will hopefully work later
                      });
                    },
                    color: Colors.blueGrey[100],
                    child: Text('Withdrawl'),
                    padding: EdgeInsets.all(4.0),
                    //shape: CircleBorder(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(
              height: 25.0,
            ),

            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("this i likely where we have the same issues where setstate fucks up, perhaps a lot of writing to file will help"),// add a box to type in the deposit or withdrawl amount
            )
          ],
        ),
    );
  }
}
