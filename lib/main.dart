import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheduled_map/add/screens/add_screen.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/details/screen/details_screen.dart';
import 'package:scheduled_map/home/screen/home_screen.dart';
import 'package:scheduled_map/search/screen/search_screen.dart';

import 'add/controllers/selected_time_controller.dart';
import 'details/controllers/switch_controller.dart';
import 'home/controllers/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SelectedTimeController selectedTimeController =
      Get.put(SelectedTimeController());
  final HomeController homeController = Get.put(HomeController());
  final SwitchController switchController = Get.put(SwitchController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '언제갈까',
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            shape: StadiumBorder(),
            backgroundColor: primaryColor,
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black38,
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
        ),
        GetPage(
          name: "/search",
          page: () => SearchScreen(),
          transition: Transition.downToUp,
          transitionDuration: Duration(milliseconds: 1500),
          curve: Curves.elasticOut,
        ),
      ],
      initialRoute: "/home",
    );
  }
}
