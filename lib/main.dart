import 'package:flutter/material.dart';
import 'package:drivingratingapp/Screens/Navigator.dart';
import 'package:drivingratingapp/Screens/Leaderboard.dart';
import 'package:drivingratingapp/Screens/Dashboard.dart';
import 'package:drivingratingapp/Screens/Map.dart';
import 'package:drivingratingapp/Screens/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rate My Driver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
