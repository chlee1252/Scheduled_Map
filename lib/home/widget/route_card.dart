import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/home/controllers/home_controller.dart';
import 'package:scheduled_map/home/widget/on_icon.dart';
import 'package:scheduled_map/home/widget/time.dart';
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Time(startTime: "12:00"),
                OnIcon(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
