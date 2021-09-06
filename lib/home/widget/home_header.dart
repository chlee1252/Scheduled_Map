import 'package:flutter/material.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/home/utils/time_utils.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerHeight,
      color: Colors.white,
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good " + TimeUtils.greeting() + "!",
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                "Name",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black54),
              )
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
          )
        ],
      ),
    );
  }
}
