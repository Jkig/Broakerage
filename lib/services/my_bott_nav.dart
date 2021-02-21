/*
import 'package:flutter/material.dart';
import 'package:brokerage_app/pages/profile.dart';
import 'package:brokerage_app/pages/search.dart';
import 'package:brokerage_app/pages/home.dart';
 */
/*

class MyBottNav extends StatefulWidget {
  @override
  _MyBottNavState createState() => _MyBottNavState();
}

class _MyBottNavState extends State<MyBottNav> {
  int _currentIndex = 0;
  List<Widget> _children =
  [
    Home(),
    Search(),
    Profile()
  ];




  @override
  void onTappedBar(int index){
    setState((){
      _currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey[200],
        currentIndex: _currentIndex,
        onTap: onTappedBar,
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
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],

      ),
    );
  }
}


*/
