import 'package:get/get.dart';
import 'package:scheduled_map/search/dto/location_info.dart';

class LocationInfoController extends GetxController {
  LocationInfo depart = new LocationInfo();
  LocationInfo destination = new LocationInfo();

  void setDepart(LocationInfo depart) {
    this.depart = depart;
    update();
  }

  void setDestination(LocationInfo destination) {
    this.destination = destination;
    update();
  }
}
