import 'package:flutter/material.dart';

class ScoreDisplay extends StatefulWidget {
  @override
  _ScoreDisplayState createState() => _ScoreDisplayState();
}

class _ScoreDisplayState extends State<ScoreDisplay> {
  final List<int> scores = [92, 76, 78, 85];
  double avgdouble;
  int avg;

  @override
  Widget build(BuildContext context) {
    avgdouble = scores.reduce((a, b) => a + b) / scores.length;
    avg = avgdouble.toInt();
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 260.0,
            color: Color.fromRGBO(0, 0, 0, 0.85),
            child: Column(
              children: <Widget>[
                Text(''),
                Text(
                  'Drive Score',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 230, 255, 100),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(''),
                Container(
                  height: 175.0,
                  width: 175.0,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(35, 35, 35, 1.0),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: avg < 70
                              ? Colors.red
                              : avg < 80
                                  ? Colors.deepOrange
                                  : avg < 90
                                      ? Colors.yellow
                                      : avg < 101
                                          ? Colors.lightGreenAccent
                                          : Colors.grey,
                          blurRadius: 10.0,
                          spreadRadius: 4.0),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      avg.toString(),
                      style: TextStyle(
                          fontSize: 75.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 150, 255, 100)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
