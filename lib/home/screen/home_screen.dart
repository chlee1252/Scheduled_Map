import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/home/controllers/home_controller.dart';
import 'package:scheduled_map/home/widget/home_header.dart';
import 'package:scheduled_map/home/widget/route_card.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.find();

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
                  child: GetBuilder<HomeController>(
                    builder: (value) => GridView.builder(
                      itemCount: homeController.getItems().length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        mainAxisSpacing: defaultPadding,
                        crossAxisSpacing: defaultPadding,
                      ),
                      itemBuilder: (context, index) => RouteCard(
                        index: index,
                        items: homeController.getItems()[index],
                        press: () => Get.toNamed(
                          "/details",
                          arguments: {
                            "title": homeController.getItems()[index].title!,
                            "depart": homeController.getItems()[index].depart,
                            "destination":
                                homeController.getItems()[index].destination,
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: greyTheme,
        child: Icon(
          Icons.add,
          color: Colors.black54,
        ),
        onPressed: () => Get.toNamed("/add"),
      ),
    );
  }
}
