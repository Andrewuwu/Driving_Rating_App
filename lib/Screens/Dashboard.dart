import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dashboard')),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Dashboard"),
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_circle),
              title: Text("Profile"),
              backgroundColor: Colors.lightBlueAccent,
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
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
