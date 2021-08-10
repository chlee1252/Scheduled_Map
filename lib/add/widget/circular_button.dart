import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    Key? key,
    this.primaryColor,
    this.onPrimaryColor,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  final Color? primaryColor;
  final Color? onPrimaryColor;
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          onPrimary: onPrimaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
        onPressed: this.onPressed,
        child: this.child,
      ),
    );
  }
}
