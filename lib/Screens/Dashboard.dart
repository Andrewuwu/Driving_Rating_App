import 'package:flutter/material.dart';
import 'package:drivingratingapp/Widgets/ScoreDisplay.dart';
import 'package:drivingratingapp/Widgets/StatisticsScroll.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> goals = [
    'Make softer turns.',
    'Switch to reverse less when parking.',
    'Reach the 90th percentile.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: Text(
                  '—Goals—',
                  style: TextStyle(fontSize: 50.0),
                ),
              ),
            ),
            Container(
              child: ListView.builder(
                itemCount: goals.length,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          ScoreDisplay(),
          StatisticsScroll(),
        ],
      ),
    );
  }
}
