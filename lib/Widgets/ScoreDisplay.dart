import 'package:flutter/material.dart';

class ScoreDisplay extends StatefulWidget {
  @override
  _ScoreDisplayState createState() => _ScoreDisplayState();
}

class _ScoreDisplayState extends State<ScoreDisplay> {
  final List<int> scores = [92, 68, 78, 85];
  double avgd;
  int avg;

  @override
  Widget build(BuildContext context) {
    avgd = scores.reduce((a, b) => a + b) / scores.length;
    avg = avgd.toInt();
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 6 / 24,
          height: MediaQuery.of(context).size.height * 33 / 80,
          color: Color.fromRGBO(0, 0, 0, 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Avg Drive Time',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 230, 255, 100),
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  '                                ',
                  style: TextStyle(
                    fontSize: 5.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '8' + 'min',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 251, 230, 1.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 3 / 6,
          height: MediaQuery.of(context).size.height * 33 / 80,
          color: Color.fromRGBO(0, 0, 0, 0.1),
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
                        spreadRadius: 2.0),
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
        Container(
          width: MediaQuery.of(context).size.width * 6 / 24,
          height: MediaQuery.of(context).size.height * 33 / 80,
          color: Color.fromRGBO(0, 0, 0, 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Percentile',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 230, 255, 100),
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  '                                ',
                  style: TextStyle(
                    fontSize: 5.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '89' + '\u1d57\u02b0',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 251, 230, 1.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
