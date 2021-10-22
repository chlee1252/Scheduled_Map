import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/details/widget/bottom_panel.dart';
import 'package:scheduled_map/details/widget/collapsed_panel.dart';
import 'package:scheduled_map/home/widget/map.dart';
import 'package:scheduled_map/home/widget/on_icon.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailsScreen extends StatelessWidget {
  AppBar _buildAppBar(String title) {
    return AppBar(
      leading: BackButton(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      centerTitle: true,
      title: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
      ),
      actions: [
        OnIcon(radius: 15),
        SizedBox(
          width: defaultPadding,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SafeArea(
            child: _buildAppBar(Get.arguments['title']),
          ),
        ),
      ),
      body: SlidingUpPanel(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
        minHeight: MediaQuery.of(context).size.height * 0.15,
        body: Map(),
        collapsed: CollapsedPanel(
          radius: radius,
          widget: Center(
            child: Text("경로 더보기"),
          ),
        ),
        panel: BottomPanel(
          widget: Center(
            child: Text("경로 더보기"),
          ),
        ),
        borderRadius: radius,
      ),
    );
  }
}
