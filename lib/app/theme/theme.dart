import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  static const Color lightGreen = Color(0xffcaefdb);
  static const Color green = Color(0xff03a84e);

  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);

  static ThemeData get themeData => Get.isDarkMode ? AppTheme.dark() : AppTheme.light();

  static ThemeData light() {
    return ThemeData(
      // textTheme: TextTheme(button: ),
      scaffoldBackgroundColor: lightGreen,
    );
  }

  static ThemeData dark() {
    return ThemeData(
        //mobile app background color
        scaffoldBackgroundColor: black);
  }
}

class Dimensions {
  //standard unit for the app
  static double unit = Get.width / 100;
}

class Images {
  static const String onboard1 = "assets/onboard1.png";
  static const String onboard2 = "assets/onboard2.png";
  static const String onboard3 = "assets/onboard3.png";
}
