import 'package:drivingratingapp/Screens/Leaderboard.dart';
import 'package:drivingratingapp/Screens/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:drivingratingapp/Screens/Map.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 0;
  var _pages = [
    Dashboard(),
    Map(),
    Leaderboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Driving Rater'),
        ),
        body: _pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedTab,
            backgroundColor: Colors.white70,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Dashboard"),
                backgroundColor: Colors.blueAccent,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text("Map"),
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                title: Text("Leaderboard"),
                backgroundColor: Colors.lightBlue,
              ),
            ],
            onTap: (int index) {
              setState(() {
                _selectedTab = index;
              });
            }));
  }
}
