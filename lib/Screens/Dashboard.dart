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
      body: Column(
        children: <Widget>[
          ScoreDisplay(),
          StatisticsScroll(),
        ],
      ),
    );
  }
}
