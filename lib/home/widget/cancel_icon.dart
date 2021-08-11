import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CancelIcon extends StatelessWidget {
  const CancelIcon({
    Key? key,
    this.radius = 12,
  }) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: SvgPicture.asset("assets/icon/cancel.svg"),
    );
  }
}
