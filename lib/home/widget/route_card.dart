import 'package:flutter/material.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/home/widget/on_icon.dart';
import 'package:scheduled_map/home/widget/time.dart';
import 'package:scheduled_map/models/Items.dart';

class RouteCard extends StatelessWidget {
  const RouteCard({
    Key? key,
    required this.items,
    required this.press,
  }) : super(key: key);

  final Items items;
  final VoidCallback press;

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
            Image.asset(items.image!),
            Text(
              items.title!,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
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
