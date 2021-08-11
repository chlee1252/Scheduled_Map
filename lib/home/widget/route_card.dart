import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/details/controllers/switch_controller.dart';
import 'package:scheduled_map/home/controllers/home_controller.dart';
import 'package:scheduled_map/home/widget/notification_switch.dart';
import 'package:scheduled_map/models/Items.dart';

class RouteCard extends StatelessWidget {
  RouteCard({
    Key? key,
    required this.items,
    required this.press,
    required this.index,
  }) : super(key: key);

  final Items items;
  final int index;
  final VoidCallback press;
  final HomeController homeController = Get.find();
  final SwitchController switchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding * 1.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: IconButton(
                  onPressed: () => homeController.removeItem(index),
                  icon: Icon(
                    CupertinoIcons.delete_simple,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          _buildTouchPortion(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat.jm().format(items.date),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              NotificationSwitch(items: items, index: index),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTouchPortion(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(items.image!),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              items.title!,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            "Bus",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
