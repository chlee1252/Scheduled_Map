import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scheduled_map/home/controllers/home_controller.dart';
import 'package:scheduled_map/models/Items.dart';
import 'package:scheduled_map/util/color_util.dart';

class NotificationSwitch extends StatelessWidget {
  NotificationSwitch({
    Key? key,
    required this.items,
    required this.index,
  }) : super(key: key);

  final Items items;
  final int index;
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Transform.scale(
        scale: 0.7,
        child: CupertinoSwitch(
          activeColor: ColorUtil.convertHexToColor(hexColorCode: "#83E4F9"),
          value: items.notification.value,
          onChanged: (value) => homeController.toggleSwitch(index),
        ),
      ),
    );
  }
}
