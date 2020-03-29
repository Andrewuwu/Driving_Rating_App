import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  int index = 1;
  final names = [
    'Anton',
    'Andrew',
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
    '99.jpg',
  ];
  final names2 = [
    'Anton',
    'Andrew',
    'Vincent',
    'Art',
    'Bob',
    'Samuel',
    'Cameron',
    'Lucas'
  ];
  final stats2 = ['92', '89', '88', '70', '69', '54', '38', '33'];
  final profile2 = [
    '0.jpg',
    '8.jpg',
    'profile.jpg',
    '98.jpg',
    '11.jpg',
    '79.jpg',
    '29.jpg',
    '99.jpg'
  ];
  final names3 = [
    'Vincent',
    'Anton',
    'Bob',
    'Cameron',
    'Andrew',
    'Samuel',
    'Art',
    'Lucas'
  ];
  final stats3 = ['100', '85', '81', '78', '69', '68', '40', '24'];
  final profile3 = [
    'profile.jpg',
    '0.jpg',
    '11.jpg',
    '29.jpg',
    '8.jpg',
    '79.jpg',
    '98.jpg',
    '99.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(35, 35, 35, 10),
        body: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Text(
                  'Daily',
                  style: TextStyle(
                      fontSize: 32, color: Color.fromRGBO(192, 192, 192, 10)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: Text(
                  'Weekly',
                  style: TextStyle(
                      fontSize: 32, color: Color.fromRGBO(192, 192, 192, 10)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
                child: Text(
                  'All Time',
                  style: TextStyle(
                      fontSize: 32, color: Color.fromRGBO(192, 192, 192, 10)),
                ),
              ),
            ],
          ),
          index == 1
              ? _createRank(context, names, stats, profile)
              : index == 2
                  ? _createRank(context, names2, stats2, profile2)
                  : index == 3
                      ? _createRank(context, names3, stats3, profile3)
                      : index > 3
        ]));
  }

  Widget _createRank(BuildContext context, List<String> name, List<String> num,
      List<String> profilePic) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(name[index],
                style: TextStyle(
                    fontSize: 24, color: Color.fromRGBO(192, 192, 192, 10))),
            leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${profilePic[index]}')),
            trailing: Text(
              num[index],
              style: TextStyle(
                  fontSize: 24, color: Color.fromRGBO(192, 192, 192, 10)),
            ),
          );
        },
      ),
    );
  }
}
