import 'package:get/get.dart';

class SelectedTimeController extends GetxController {
  DateTime _time = DateTime.now();

  DateTime getTime() => _time;

  void setTime(DateTime newTime) {
    _time = newTime;
    update();
  }

  void resetTimeToNow() {
    _time = DateTime.now();
  }
}
