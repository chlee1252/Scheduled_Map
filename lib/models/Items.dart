import 'package:get/get.dart';

class Items {
  final String? title, image;
  RxBool notification = true.obs;
  DateTime date;

  Items({this.title, this.image, required this.date});
}
