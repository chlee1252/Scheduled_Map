import 'package:geolocator/geolocator.dart';

class LocationService {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    Position? position;

    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (ex) {
      print(ex);
    }

    if (position != null) {
      this.latitude = position.latitude;
      this.longitude = position.longitude;
    }
  }
}
