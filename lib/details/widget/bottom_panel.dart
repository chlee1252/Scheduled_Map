import 'package:flutter/material.dart';
import 'package:scheduled_map/details/widget/handle_bar.dart';

class BottomPanel extends StatelessWidget {
  BottomPanel({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
