import 'package:flutter/material.dart';
import 'package:scheduled_map/details/widget/handle_bar.dart';

class BottomPanel extends StatelessWidget {
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
          child: Center(
            child: Text("경로 더보기"),
          ),
        ),
      ],
    );
  }
}
