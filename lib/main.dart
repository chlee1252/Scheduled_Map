import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheduled_map/add/controllers/text_field_controller.dart';
import 'package:scheduled_map/add/screens/add_screen.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/details/screen/details_screen.dart';
import 'package:scheduled_map/home/screen/home_screen.dart';

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
  final TextFieldController addTextFormField = Get.put(TextFieldController());

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
