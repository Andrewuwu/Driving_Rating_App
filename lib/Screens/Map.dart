import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if(_currentPosition!= null)
            Text(
              _currentAddress,
            ),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                _getCurrentLocation(); // Get location here
              },
            ),
          ],
        ),
      ),
    );
  }
  _getCurrentLocation() {

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLngLat();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLngLat() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
  _getSpeed() async {
    double distance = await Geolocator().distanceBetween(52.2165157, 6.9437819, 52.3546274, 4.8285838);
    return (distance/2);

  }
}