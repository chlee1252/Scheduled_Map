import 'package:flutter/material.dart';
import 'package:scheduled_map/constants.dart';

class Time extends StatelessWidget {
  const Time({
    Key? key,
    required this.startTime,
  }) : super(key: key);

  final String startTime;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
          TextSpan(
            text: startTime,
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: "AM",
                style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.normal),
              ),
            ]
          ),
    );
  }
}
