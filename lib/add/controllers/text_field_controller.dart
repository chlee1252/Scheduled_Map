import 'package:get/get.dart';

class TextFieldController extends GetxController {
  String text = "일정";

  String get getText => text;

  void setText(String text) {
    this.text = text;
  }
}
