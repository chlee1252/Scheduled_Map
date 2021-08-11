import 'package:flutter/material.dart';

class DetailsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsAppbar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
