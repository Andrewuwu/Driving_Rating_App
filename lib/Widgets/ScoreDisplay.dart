import 'package:flutter/material.dart';

class ScoreDisplay extends StatefulWidget {
  @override
  _ScoreDisplayState createState() => _ScoreDisplayState();
}

class _ScoreDisplayState extends State<ScoreDisplay> {
  final List<int> scores = [70, 85, 92, 76, 78, 96];
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
            height: 250.0,
            color: Color.fromRGBO(0, 0, 0, 50),
            child: Column(
              children: <Widget>[
                Text(
                  'Drive Score',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 230, 255, 100)),
                  textAlign: TextAlign.center,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                            border: Border.all(),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      avg.toString(),
                      style: TextStyle(
                          fontSize: 75.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(30, 180, 255, 100)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
