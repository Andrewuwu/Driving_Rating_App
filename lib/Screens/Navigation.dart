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
          backgroundColor: Color.fromRGBO(25, 22, 55, 1),
          title: Text('Driving Rater'),
        ),
        body: _pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedTab,
            backgroundColor: Color.fromRGBO(35, 35, 35, 1.0),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white),
                title: Text("Dashboard", style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.white70,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.white),
                title: Text("Map", style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.white70,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star, color: Colors.white),
                title:
                    Text("Leaderboard", style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.white70,
              ),
            ],
            onTap: (int index) {
              setState(() {
                _selectedTab = index;
              });
            }));
  }
}
