import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scheduled_map/search/dto/location_info.dart';

class Map extends StatelessWidget {
  const Map({
    Key? key,
    required LocationInfo this.depart,
    required LocationInfo this.destination,
  }) : super(key: key);

  final LocationInfo depart;
  final LocationInfo destination;

  @override
  Widget build(BuildContext context) {
    final LatLng departLatLng =
        new LatLng(double.parse(depart.y!), double.parse(depart.x!));
    final LatLng destinationLatLng =
        new LatLng(double.parse(destination.y!), double.parse(destination.x!));
    final CameraPosition _user = CameraPosition(
      target: departLatLng,
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
      markers:
          Set<Marker>.of(_createMarkerList(departLatLng, destinationLatLng)),
    );
  }

  List<Marker> _createMarkerList(
      LatLng departLatLng, LatLng destinationLatLng) {
    return [
      _createMarker(departLatLng, "depart"),
      _createMarker(destinationLatLng, "destination"),
    ];
  }

  Marker _createMarker(LatLng latLng, String id) {
    return Marker(markerId: MarkerId(id), position: latLng);
  }
}
