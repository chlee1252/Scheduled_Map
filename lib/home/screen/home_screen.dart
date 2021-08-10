import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/details/screen/details_screen.dart';
import 'package:scheduled_map/home/widget/home_header.dart';
import 'package:scheduled_map/home/widget/route_card.dart';
import 'package:scheduled_map/models/Items.dart';

class HomeScreen extends StatelessWidget {
  final List<Items> example = [
    new Items(title: "item1", image: "assets/icon/bus.png"),
    new Items(title: "item2", image: "assets/icon/bus.png"),
    new Items(title: "item3", image: "assets/icon/bus.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Column(
            children: [
              HomeHeader(),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(defaultPadding * 1.5),
                      bottomRight: Radius.circular(defaultPadding * 1.5),
                    ),
                  ),
                  child: GridView.builder(
                    itemCount: example.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: defaultPadding,
                      crossAxisSpacing: defaultPadding,
                    ),
                    itemBuilder: (context, index) => RouteCard(
                      items: example[index],
                      press: () => Get.to(
                        DetailsScreen(title: example[index].title!),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
