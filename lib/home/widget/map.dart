import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatelessWidget {
  final LatLng latLng = new LatLng(37.5559, 126.9723);

  @override
  Widget build(BuildContext context) {
    final CameraPosition _user = CameraPosition(
      target: latLng,
      zoom: 15.0,
      tilt: 0,
    );

    return GoogleMap(
      initialCameraPosition: _user,
      mapType: MapType.normal,
      myLocationEnabled: true,
      padding: EdgeInsets.only(
        bottom: 100.0,
      ),
    );
  }
}
