import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  final List<String> _names = <String>[
    'Andrew',
    'John' 'Bob' 'Cameron' 'Bill' 'Vincent' 'Samuel' 'Art' 'Lucas'
  ];
  final List<String> _points = <String>[
    '10000',
    '1234' '235' '195' '187' '124' '97' '64' '0'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            child: Text('Weekly'),
            onPressed: () {},
          ),
          RaisedButton(
            child: Text('Monthly'),
            onPressed: () {},
          ),
          RaisedButton(
            child: Text('All Time'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
