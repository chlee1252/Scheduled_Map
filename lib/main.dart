import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheduled_map/add/screens/add_screen.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/details/screen/details_screen.dart';
import 'package:scheduled_map/home/screen/home_screen.dart';

import 'add/controllers/selected_time_controller.dart';
import 'home/controllers/home_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SelectedTimeController selectedTimeController =
      Get.put(SelectedTimeController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '언제갈까',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            shape: StadiumBorder(),
            backgroundColor: primaryColor,
          ),
        ),
      ),
      getPages: [
        GetPage(
          name: "/home",
          page: () => HomeScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: "/details",
          page: () => DetailsScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: "/add",
          page: () => AddScreen(),
          transition: Transition.fadeIn,
        )
      ],
      initialRoute: "/home",
    );
  }
}
