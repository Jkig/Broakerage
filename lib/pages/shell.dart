import 'package:flutter/material.dart';
import 'home.dart';
import 'search.dart';
import 'profile.dart';
import 'package:brokerage_app/services/stock_data.dart';
import 'package:brokerage_app/services/globals.dart' as globals;

class Shell extends StatefulWidget {
  @override
  _ShellState createState() => _ShellState();
}

class _ShellState extends State<Shell> {

    int _selectedIndex = 0; //What page are we on?
    void _onItemTapped(int index) {
      // pop to one or annother
      setState(() {
        _selectedIndex = index;
      });
    }
    //int _currentIndex = 0; // is this fucked?

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


      Widget widgetInter = Container(color: Theme
          .of(context)
          .accentColor,); // is this container where it needs to not be the case?>
      //switch (_currentIndex) {
      switch (_selectedIndex) {
        case 0:
          widgetInter = Home();
          break;

        case 1:
          widgetInter = Search();
          break;

        case 2:
          widgetInter = Profile();
          break;
      }

    return Scaffold(

      //bottomNavigationBar: MyBottNav(),

      body: widgetInter,//here will be the call for the roud as seen above

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blueGrey[200],
          items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
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
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),

    );//scaffold with body and bottom bar...?
  }
}
/*
Widget BottomBarGuy (context, List<StockData> stockList, double totalVal, double cashval){
  SizedBox(
    height: 30.0,
    child: Row(
      children: [
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/search', arguments: {
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
  );
}
 */