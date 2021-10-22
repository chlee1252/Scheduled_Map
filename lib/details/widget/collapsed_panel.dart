import 'package:flutter/material.dart';

import 'handle_bar.dart';

class CollapsedPanel extends StatelessWidget {
  CollapsedPanel({
    Key? key,
    required this.radius,
    required this.widget,
  }) : super(key: key);

  final BorderRadiusGeometry radius;
  final Widget widget;

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
            child: widget,
          ),
        ],
      ),
    );
  }
}
