import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(//// get rid of appBar because we are places?
          title: Text('Search'),
          centerTitle: true,
          backgroundColor: Colors.blue[600],
        ),

        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                    height: 15.0,
                ),
                Center(
                  child: SizedBox(
                    height: 40.0,
                    width: 350.0,
                    child: Card(
                      color: Colors.grey[500],
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '   New Stock',
                        ),
                        onSubmitted: (String str) {
                          setState((){  // irl some string will be updated to this value, I think this is waaaay later though

                          });

                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 12.5,
                ),

                ButtonTheme(
                  minWidth: 60.0,
                  height: 35.0,
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        //will hopefully work later

                        //(context as Element).reassemble();
                      });
                    },

                    //if (accountNumber == 0) {color: Colors.blueGrey[100];}else{color: Colors.blue[600];}
                    color: Colors.blue[600],

                    child: Text('ADD'),
                    padding: EdgeInsets.all(4.0),
                    //shape: CircleBorder(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                ),

              ],
            )
        )
    );
  }
}