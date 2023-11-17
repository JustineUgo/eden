import 'dart:io';

import 'package:eden/app/di/binding.dart';
import 'package:eden/app/services/storage_service.dart';
import 'package:eden/app/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'app/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    await Firebase.initializeApp();
  }
  //storage init
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(StorageService(storage: GetStorage()));
    bool isFirstLaunch = Get.find<StorageService>().firstLaunch;
    return GetMaterialApp(
      initialRoute: isFirstLaunch ? Paths.onboard : null,
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      initialBinding: AppBinding(),
    );
  }
}
