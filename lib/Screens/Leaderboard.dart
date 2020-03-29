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
            onPressed: () {
              _displayRanking();
            },
          ),
          RaisedButton(
            child: Text('Monthly'),
            onPressed: () {},
          ),
          RaisedButton(
            child: Text('All Time'),
            onPressed: () {
              _displayRanking();
            },
          ),
        ],
      ),
    );
  }

  Widget _displayRanking() {
    return ListView(
      children: <Widget>[_buildRanking()],
    );
  }

  Widget _buildRanking() {
    for (int i = 0; i < _names.length; i++) {
      return ListTile(
        leading: Icon(Icons.account_circle),
        title: Text(_names[i]),
        subtitle: Text('points' + _points[i]),
      );
    }
  }
}
