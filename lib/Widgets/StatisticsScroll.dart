import 'package:flutter/material.dart';

class StatisticsScroll extends StatefulWidget {
  @override
  _StatisticsScrollState createState() => _StatisticsScrollState();
}

class _StatisticsScrollState extends State<StatisticsScroll> {
  int selectedIndex = 0;
  final List<String> categories = [
    'Braking Score',
    'Turning Score',
    'Parking Score',
    'Speed Score'
  ];
  final List<int> scores = [92, 76, 78, 96];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 244.0,
      color: Color.fromRGBO(0, 0, 0, 0.85),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.fromLTRB(35.0, 35.0, 0.0, 35.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: 170.0,
                  height: 154.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        categories[index],
                        style: TextStyle(fontSize: 19.0),
                      ),
                      Text(''),
                      Stack(
                        children: <Widget>[
                          Text(
                            scores[index].toString(),
                            style: TextStyle(
                                fontSize: 55.0, fontWeight: FontWeight.bold),
                          ),
                          Positioned(
                            bottom: 5,
                            right: -30,
                            child: Text(
                              '/100',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        overflow: Overflow.visible,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
