import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';



const double CAMERA_ZOOM = 17;
const double CAMERA_TILT = 40;
const double CAMERA_BEARING = 0;
const LatLng SOURCE_LOCATION = LatLng(42, -71);
const LatLng DEST_LOCATION = LatLng(37,-122);

class PinInformation {
  String pinPath;
  String avatarPath;
  LatLng location;
  String locationName;
  Color labelColor;

  PinInformation({
    this.pinPath,
    this.avatarPath,
    this.location,
    this.locationName,
    this.labelColor
});
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;
  LocationData previous;

  Geolocator _geolocator = Geolocator();
  Position _position;

  double pinPillPosition = -100;

  Timer _timer;
  Timer timer;
  int _start = 0;
  int _end = 0;
  double _speed = 0;
  double _value=0;

  PinInformation currentlySelectedPin = PinInformation(
    pinPath: '',
    avatarPath: '',
    location: LatLng(0,0),
    locationName: '',
    labelColor: Colors.grey
  );

  PinInformation sourcePinInfo;
  PinInformation destinationPinInfo;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(29.583328, -98.619637),
    bearing: CAMERA_BEARING,
    tilt: CAMERA_TILT,
    zoom: CAMERA_ZOOM,
  );

  @override
  void initState() {
    super.initState();
    LocationOptions locationOptions = LocationOptions();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
    (Timer timer) => setState(
        () {
          _start = _start + 1;
          }
    )
    );
  }
  void endTimer(LocationData newLocalData, LocationData newLocalData1) {
    setState(() {
      _value = (Random().nextDouble() * 10) + 15;
      //getSpeed(newLocalData, newLocalData1, (_start-_end));

    });
    _timer.cancel();

  }
  @override
  void disposeTime() {
    _timer.cancel();
    super.dispose();
  }

    double getSpeed(LocationData newLocalData, LocationData newLocalData1, int time) {
    double lat1 = newLocalData.latitude;
    double lat2 = newLocalData1.latitude;
    double long1 = newLocalData.longitude;
    double long2 = newLocalData1.longitude;

    Future<double> distanceInMeters =  Geolocator().distanceBetween(lat1, long1, lat2, long2);
    setState(() {
      _speed = ((distanceInMeters as double)/time);
    });
    return _speed;
  }


  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/perfect.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
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
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {

      Uint8List imageData = await getMarker();
      LocationData location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);
      previous = location;

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }


      _locationSubscription = _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(newLocalData.latitude, newLocalData.longitude),
              tilt: 40,
              zoom: 17)));
          endTimer(previous, newLocalData);
          startTimer();
          updateMarkerAndCircle(newLocalData, imageData);

        }
      });

    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission denied");
      }
    }
  }


  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }



  Widget _speedometerPanel(){
    return Scaffold(
        body: Center(
            child: Container(
                color: Color.fromRGBO(35, 35, 35, 1.0),
                child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(minimum: 0, maximum: 100, labelOffset: 30,
                          axisLineStyle: AxisLineStyle(
                              thicknessUnit: GaugeSizeUnit.factor,thickness: 0.03),
                          majorTickStyle: MajorTickStyle(length: 6,thickness: 4,color: Colors.white),
                          minorTickStyle: MinorTickStyle(length: 3,thickness: 3,color: Colors.white),
                          axisLabelStyle: GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14 ),
                          ranges: <GaugeRange>[
                            GaugeRange(startValue: 0, endValue: 100, sizeUnit: GaugeSizeUnit.factor,startWidth: 0.03,endWidth: 0.03,
                                gradient: SweepGradient(
                                    colors: const<Color>[Colors.green,Colors.yellow,Colors.red],
                                    stops: const<double>[0.0,0.5,1]))],
                          pointers: <GaugePointer>[NeedlePointer(value:_value, needleLength: 0.95, enableAnimation: true,
                              animationType: AnimationType.ease, needleStartWidth: 1.5, needleEndWidth: 6, needleColor: Colors.red,
                              knobStyle: KnobStyle(knobRadius: 0.09))],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(widget: Container(child:
                            Column(
                                children: <Widget>[
                                  Text(_value.toStringAsFixed(2), style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold)),
                                  //SizedBox(height: 10),
                                  Text('mph', style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.bold)),
                                Text('You are in the speed limit! Good driving :)', style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold))]
                            )), angle: 90, positionFactor: 0.75)]

                            )]
                )
            )
        )
            );
  }

  @override
  Widget build(BuildContext context) {
    return
      SlidingUpPanel(
        panel: _speedometerPanel(),
          color: Colors.black38,
          maxHeight: 230,
          minHeight: 20,
          body: Scaffold(
          body: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: initialLocation,

            markers: Set.of((marker != null) ? [marker] : []),
            circles: Set.of((circle != null) ? [circle] : []),
            onMapCreated: (GoogleMapController controller) {
              startTimer();
              _controller = controller;
              getCurrentLocation();
            },
          ),
        ),
      );

  }
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
