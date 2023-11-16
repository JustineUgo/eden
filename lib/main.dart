import 'package:eden/app/di/binding.dart';
import 'package:eden/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
          // initialRoute: isFirstLaunch ? Paths.splash : null,
          initialRoute: Paths.onboard,
          debugShowCheckedModeBanner: false,
          getPages: AppRoutes.routes,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: ThemeMode.system,
          initialBinding: AppBinding(),
        );
  }
}
