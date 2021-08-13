import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduled_map/constants.dart';

class AddTextFormField extends StatelessWidget {
  AddTextFormField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.onTap,
  }) : super(key: key);

  final String label;
  final String hintText;
  final VoidCallback? onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
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
    );
  }
}
