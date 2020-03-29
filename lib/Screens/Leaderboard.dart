import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 10),
      appBar: AppBar(
        title:
            Text('Daily                   Weekly                   All Time'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: _createRank(context),
    );
  }

  Widget _createRank(BuildContext context) {
    final names = [
      'Andrew',
      'Anton',
      'Bob',
      'Cameron',
      'Vincent',
      'Samuel',
      'Art',
      'Lucas'
    ];
    final stats = ['92', '88', '86', '73', '69', '68', '42', '13'];
    final profile = [
      '0.jpg',
      '8.jpg',
      '11.jpg',
      '29.jpg',
      'profile.jpg',
      '79.jpg',
      '98.jpg',
      '99.jpg'
    ];
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(names[index],
                style: TextStyle(
                    fontSize: 24, color: Color.fromRGBO(192, 192, 192, 10))),
            leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${profile[index]}')),
            trailing: Text(
              stats[index],
              style: TextStyle(
                  fontSize: 24, color: Color.fromRGBO(192, 192, 192, 10)),
            ),
          );
        },
      ),
    );
  }
}
