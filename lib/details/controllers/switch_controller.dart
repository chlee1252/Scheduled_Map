import 'package:get/get.dart';

class SwitchController extends GetxController {
  RxBool value = true.obs;

  bool getValue() => value.value;

  void toggleSwitch() {
    value = RxBool(!value.value);
  }
}
