import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
        appBar: AppBar(//// get rid of appBar because we are places?
          title: Text('Profile'),
          centerTitle: true,
          backgroundColor: Colors.blue[600],
        ),

        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 100,),
                _otherPages(context, "Portfolio"),
                _otherPages(context, "Settings"),
                _otherPages(context, "Help"),
                _otherPages(context, "Notif"),

              ],
            )
        )
    );
  }
}

Widget _otherPages (context, String pageName) {

  String lowerCase = pageName.toLowerCase();

  return
    GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,'/$lowerCase');
      },

      child: Card(
        margin: EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
        color: Colors.grey[30],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20, width: 15),
            Text(
                  '$pageName',
                  style: TextStyle(
                    fontFamily: 'pacifico',
                    fontSize: 20.0,
                  ),
                ),
            SizedBox(height: 40, width: 15),
          ],
        ),
      ),
    );
}