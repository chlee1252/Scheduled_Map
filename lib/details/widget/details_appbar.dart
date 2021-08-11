import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/home/widget/on_icon.dart';

class DetailsAppbar extends StatelessWidget {
  const DetailsAppbar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        OnIcon(radius: 20),
        SizedBox(
          width: defaultPadding,
        )
      ],
    );
  }
}
