import 'package:get/get.dart';
import 'package:scheduled_map/search/dto/location_info.dart';

class Items {
  final String? title, image;
  RxBool notification = true.obs;
  DateTime date;
  LocationInfo depart;
  LocationInfo destination;

  Items(
      {this.title,
      this.image,
      required this.date,
      required this.depart,
      required this.destination});
}
