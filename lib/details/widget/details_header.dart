import 'package:flutter/material.dart';
import 'package:scheduled_map/constants.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
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
          Text(
            "Direction Information here",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(color:Colors.black54),
          ),
        ],
      ),
    );
  }
}
