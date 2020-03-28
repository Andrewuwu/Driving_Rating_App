import 'dart:async';
import 'dart:typed_data';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


const double CAMERA_ZOOM = 17;
const double CAMERA_TILT = 30;
const double CAMERA_BEARING = 16;
const LatLng SOURCE_LOCATION = LatLng(42, -71);
const LatLng DEST_LOCATION = LatLng(37,-122);


class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController mapController;
  final LatLng _initialPosition = const LatLng(45.521, -122.677);
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  /*void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latLng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latLng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.orangeAccent,
          center: latLng,
          fillColor: Colors.orangeAccent.withAlpha(70));
    });
    }
  }
*/
  void getCurrentPosition() async {
  try{
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if(_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription = _locationTracker.onLocationChanged().listen((newLocalData) {
        if(mapController != null) {
          mapController.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
              target: LatLng(newLocalData.latitude, newLocalData.longitude),
          )
          ));
        }
      });

  }on PlatformException catch (e) {
    if(e.code == 'PERMISSION_DENIED')
      debugPrint("Permission Denied");
    }
  }
}



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _initialPosition,
            zoom: CAMERA_ZOOM,
            bearing: CAMERA_BEARING,
            tilt: CAMERA_TILT,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_searching),
          backgroundColor: Colors.orangeAccent,
          onPressed: () {
            _getCurrentLocation();
          },
        ),
      ),
    );
  }

    /* return Scaffold(
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
 */
