import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
  TextEditingController titleTextController = TextEditingController();
  TextEditingController departTextController = TextEditingController();
  TextEditingController destinationTextController = TextEditingController();

  String get getText =>
      titleTextController.text == '' ? "일정" : titleTextController.text;

  void clearInput() {
    titleTextController.clear();
    departTextController.clear();
    destinationTextController.clear();
  }

  @override
  void onClose() {
    titleTextController.dispose();
    super.onClose();
  }
}
