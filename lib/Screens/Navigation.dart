import 'package:drivingratingapp/Screens/Leaderboard.dart';
import 'package:drivingratingapp/Screens/Dashboard.dart';
import 'package:drivingratingapp/Screens/Login.dart';
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
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.assignment,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: 'Goals',
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              tooltip: 'Logout',
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login())),
            ),
          ],
          centerTitle: true,
          backgroundColor: Color.fromRGBO(25, 22, 55, 1),
          title: Text(
            'SafeSpeed',
            style: TextStyle(fontFamily: 'Calibri'),
          ),
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(35, 35, 35, 1.0),
          ),
          child: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Container(
                    child: Center(
                      child: Text(
                        '—Goals—',
                        style: TextStyle(
                          fontSize: 50.0,
                          color: Color.fromRGBO(0, 230, 255, 100),
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    '1. Make softer turns.',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 251, 230, 1.0),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    '2. Switch between drive and reverse when parking.',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 251, 230, 1.0)),
                  ),
                ),
                ListTile(
                  title: Text(
                    '3. Reach the 90th percentile.',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 251, 230, 1.0)),
                  ),
                )
              ],
            ),
          ),
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
