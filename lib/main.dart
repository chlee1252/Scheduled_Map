import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/home/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: HomeScreen(),
    );
  }
}