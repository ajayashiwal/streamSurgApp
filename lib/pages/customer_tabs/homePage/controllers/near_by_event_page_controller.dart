import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearByEventPageDetailsController extends GetxController {
  Completer<GoogleMapController> controllerMap = Completer();
  final Map<String, Marker> markers = {};
  static const LatLng kMapCenter =  LatLng(19.018255973653343, 72.84793849278007);
  static const CameraPosition kInitialPosition =  CameraPosition(target: kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  Marker india3Marker = Marker(
    markerId: const MarkerId('India'),
    position: const LatLng(19.018255973653343, 72.84793849278007),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );


}
