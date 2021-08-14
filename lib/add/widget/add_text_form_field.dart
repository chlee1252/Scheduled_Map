import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduled_map/add/controllers/text_field_controller.dart';
import 'package:scheduled_map/constants.dart';

class AddTextFormField extends StatelessWidget {
  AddTextFormField({
    Key? key,
    required this.label,
    required this.hintText,
    this.onTap,
  }) : super(key: key);

  final String label;
  final String hintText;
  final VoidCallback? onTap;
  final TextFieldController textFieldController = Get.find();

  final TextEditingController _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: _text,
      decoration: InputDecoration(
        labelText: this.label,
        labelStyle: TextStyle(color: Colors.black),
        hintText: this.hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: greyTheme),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.black87),
          gapPadding: 10,
        ),
      ),
      onChanged: (value) {
        textFieldController.setText(value);
        print(textFieldController.getText);
      },
    );
  }
}
