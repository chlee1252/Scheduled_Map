import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/details/controllers/details_controller.dart';
import 'package:scheduled_map/details/controllers/details_state.dart';
import 'package:scheduled_map/details/widget/details_appbar.dart';

class DetailsScreen extends StatelessWidget {
  final DetailsController detailsController = DetailsController();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      detailsController.changeHomeState(DetailState.MENU);
    } else if (details.primaryDelta! > 12) {
      detailsController.changeHomeState(DetailState.NORMAL);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: greyTheme,
          child: AnimatedBuilder(
            animation: detailsController,
            builder: (context, _) {
              return LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: panelTransition,
                        top: detailsController.homeState == DetailState.NORMAL
                            ? headerHeight
                            : -(constraints.maxHeight -
                                menuBarHeight * 2 -
                                headerHeight),
                        left: 0,
                        right: 0,
                        height: constraints.maxHeight -
                            headerHeight -
                            menuBarHeight,
                        child: Container(
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(defaultPadding * 1.5),
                              bottomRight:
                                  Radius.circular(defaultPadding * 1.5),
                            ),
                          ),
                          child: Placeholder(),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: panelTransition,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height:
                            detailsController.homeState == DetailState.NORMAL
                                ? menuBarHeight
                                : constraints.maxHeight - menuBarHeight,
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(
                            color: greyTheme,
                            child: Center(
                              child: Text(
                                "경로 더보기",
                              ),
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: panelTransition,
                        top: detailsController.homeState == DetailState.NORMAL
                            ? 0
                            : -headerHeight,
                        right: 0,
                        left: 0,
                        height: headerHeight,
                        child: DetailsAppbar(
                          title: Get.arguments['title'],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
