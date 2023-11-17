import 'package:eden/app/modules/auth/view/auth_view.dart';
import 'package:eden/app/modules/home/view/home_view.dart';
import 'package:eden/app/modules/onboard/view/onboard_view.dart';
import 'package:get/get.dart';

abstract class Paths {
  static String auth = "/";
  static String onboard = "/onboard";
  static String home = "/home";
}

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: Paths.onboard,
      page: () => const OnboardScreen(),
    ),
    
    GetPage(
      name: Paths.auth,
      page: () => const AuthScreen(isTest: false),
    ),

    GetPage(
      name: Paths.home,
      page: () => const HomeScreen(),
    ),
  ];
}
