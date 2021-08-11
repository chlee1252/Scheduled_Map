import 'package:flutter/material.dart';

import 'handle_bar.dart';

class CollapsedPanel extends StatelessWidget {
  CollapsedPanel({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final BorderRadiusGeometry radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          HandleBar(
            width: 40.0,
            height: 5.0,
          ),
          Expanded(
            child: Center(
              child: Text("경로 더보기"),
            ),
          ),
        ],
      ),
    );
  }
}
