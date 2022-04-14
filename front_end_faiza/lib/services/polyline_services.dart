// // TODO Implement this library.
// import 'package:flutter/material.dart';
// import 'package:rpg_test/.env.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';

// class PolylineServices {
//   int polyId = 0;
//   Set<Polyline> polylines = <Polyline>{};
//   List<LatLng> polylineCoordinates = [];
//   PolylinePoints polylinePoints = PolylinePoints();

//   Future<Polyline?> getPolylines(
//       LatLng origin, LatLng destination, int id) async {
//     // get polyline points
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//         googleAPIKey,
//         PointLatLng(origin.latitude, origin.longitude),
//         PointLatLng(destination.latitude, destination.longitude),
//         travelMode: TravelMode.walking);
//     if (result.points.isNotEmpty) {
//       // get coordinates from polyline points
//       for (var point in result.points) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       }
//       // debugPrint("This is the co "+_polylineCoordinates.toString());
//       final String polylineIdVal = id.toString();
//       final PolylineId polylineId = PolylineId(polylineIdVal);
//       return Polyline(
//           width: 5,
//           polylineId: polylineId,
//           color: Colors.blue,
//           points: polylineCoordinates);
//     }
//     return null;
//   }
// }