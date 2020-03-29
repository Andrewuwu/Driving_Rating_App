import 'package:flutter/material.dart';
import 'package:drivingratingapp/Widgets/ScoreDisplay.dart';
import 'package:drivingratingapp/Widgets/StatisticsScroll.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            ScoreDisplay(),
            StatisticsScroll(),
          ],
        ),
      ),
    );
  }
}
