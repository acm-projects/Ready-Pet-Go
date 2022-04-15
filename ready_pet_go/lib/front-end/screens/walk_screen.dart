import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../back-end/models/pet.dart';
import '../../back-end/services/polyline_services.dart';
import 'finish_walk_screen.dart';

class WalkScreen extends StatefulWidget {
  final String userId;
  final Pet pet;
  const WalkScreen(this.pet, this.userId, {Key? key}) : super(key: key);

  @override
  State<WalkScreen> createState() => _WalkScreenState();
}

class _WalkScreenState extends State<WalkScreen> {
  int _initStepCount = -1;
  late Stream<StepCount> _stepCountStream;
  // late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _steps = '0';

  // map variables
  StreamSubscription? _locationSubscription;
  final Location _locationTracker = Location();
  Marker? _origin;
  Marker? destination;
  Marker? _currentPosition;
  LatLng? _tempPos;
  double _totalDistanceMap = 0;
  double _totalDistanceStep = 0;
  int polyId = 0;
  // ignore: prefer_final_fields
  Set<Polyline> _polylines = <Polyline>{};
  String? _timerFinal;
  String durationFinal = '';
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  double totalDistanceFinal = 0;
  final PolylineServices _polylineServices = PolylineServices();

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(32.98859329394406, -96.75015585660579),
    zoom: 15,
  );
  late GoogleMapController _googleMapController;

  @override
  void initState() {
    super.initState();
    initStartStreams();
  }

  void onStepCount(StepCount event) {
    debugPrint("Step happened " + event.toString());
    setState(() {
      if (_initStepCount == -1) {
        _initStepCount = event.steps;
      }
      _steps = (event.steps - _initStepCount).toString();
    });
  }

  void onStepCountError(error) {
    debugPrint('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initStartStreams() async {
    debugPrint("INIT LMAO");
    await Permission.activityRecognition.request().isGranted;

    if (await Permission.activityRecognition.request().isGranted) {
      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);

      // start tracking location
      var location = await _locationTracker.getLocation();
      LatLng initialPosition =
          LatLng(location.latitude!.toDouble(), location.longitude!.toDouble());
      Uint8List imageData = await getMarker();
      _updateMarkerAndDistance(initialPosition, imageData);
      // listening to change in location
      _locationSubscription =
          _locationTracker.onLocationChanged.listen((newLocalData) {
        debugPrint("Location changed");
        LatLng newPos = LatLng(newLocalData.latitude!.toDouble(),
            newLocalData.longitude!.toDouble());
        _updateMarkerAndDistance(newPos, imageData);
      });
    } else {
      debugPrint("This does not work LMAO");
    }
    if (!mounted) return;
  }

  @override
  void dispose() {
    debugPrint("DISPOSE LMAO");
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          title: const Text('Walking Your Pet...',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                  fontSize: 20)),
          actions: [
            TextButton(
              onPressed: goToResultScreen,
              style: TextButton.styleFrom(
                primary: const Color(0xFF00A5E0),
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('DONE',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontSize: 15)),
            )
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              // myLocationButtonEnabled: false,
              // mapType: MapType.hybrid,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) =>
                  _googleMapController = controller,
              initialCameraPosition: _initialCameraPosition,
              markers: {
                if (_origin != null) _origin as Marker,
                if (_currentPosition != null) _currentPosition as Marker,
              },
              polylines: _polylines,
            ),
            Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF00A5E0),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  '$_steps steps',
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF00A5E0),
          foregroundColor: Colors.black,
          onPressed: () => {
            _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: _currentPosition == null
                      ? const LatLng(32.98859329394406, -96.75015585660579)
                      : _currentPosition?.position as LatLng,
                  zoom: 18.0,
                ),
              ),
            ),
          },
          child: const Icon(Icons.center_focus_strong),
        ),
      ),
    );
  }

  // change icon of marker to dog
  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context)
        .load("assets/dog_icon_walking.png");
    return byteData.buffer.asUint8List();
  }

  void _updateMarkerAndDistance(LatLng pos, Uint8List imageData) async {
    if (_origin == null) {
      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: pos,
        );
      });

      _tempPos = pos;
    } else {
      setState(() {
        _currentPosition = Marker(
          icon: BitmapDescriptor.fromBytes(imageData),
          markerId: const MarkerId('currentPosition'),
          infoWindow: const InfoWindow(title: 'Current Position'),
          position: pos,
        );
      });
      double newDistance = calculateDistance(
          _tempPos?.latitude, _tempPos?.longitude, pos.latitude, pos.longitude);
      // if the distance is at least 1 meter
      _totalDistanceStep = int.parse(_steps) * 2.5;
      totalDistanceFinal = _totalDistanceStep;
      if (newDistance * 1000 >= 2) {
        // add new distance to totalDistanceMap in km
        _totalDistanceMap += newDistance;
        debugPrint(_totalDistanceMap.toString() + " IN KM");
        // distance in feet from totalDistanceMap
        double totalDistanceMapInFeet = _totalDistanceMap * 3280.84;
        // if the distance on the map is less than 50m, use steps to calculate distance, else use the map
        if (totalDistanceMapInFeet >= 164) {
          // totalDistanceFinal = _totalDistanceStep;
          totalDistanceFinal = totalDistanceMapInFeet;
        }
        // get and set polyline b
        Polyline newPolyline = await _polylineServices.getPolylines(
            _tempPos as LatLng, pos, polyId) as Polyline;
        setState(() {
          _polylines.add(newPolyline);
        });
        polyId++;
        // current position is now the new origin
        _tempPos = pos;
      }
    }
    // }
  }

  double calculateDistance(lat1, long1, lat2, long2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((long2 - long1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void processTimer() {
    durationFinal = '';
    // stop time counter
    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
    _timerFinal = StopWatchTimer.getDisplayTime(_stopWatchTimer.rawTime.value);
    int hours = int.parse(_timerFinal?.substring(0, 2) as String);
    int minutes = int.parse(_timerFinal?.substring(3, 5) as String);
    int seconds = int.parse(_timerFinal?.substring(6, 8) as String);
    if (hours != 0) {
      if (hours > 1) {
        durationFinal += '$hours hours ';
      } else {
        durationFinal += '$hours hour ';
      }
    }
    if (minutes != 0) {
      durationFinal += '$minutes minutes ';
    }
    if (seconds != 0) {
      durationFinal += '$seconds seconds';
    }
    debugPrint(_timerFinal);
  }

  void goToResultScreen() {
    _locationSubscription?.cancel();
    processTimer();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FinishScreen(widget.pet,widget.userId,totalDistanceFinal, durationFinal),
      ),
    );
  }
}
