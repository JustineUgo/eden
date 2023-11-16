import 'package:eden/app/modules/onboard/view/onboard_view.dart';
import 'package:get/get.dart';

abstract class Paths {
  static String signin = "/";
  static String onboard = "/onboard";
  static String dashboard = "/home";
}

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: Paths.onboard,
      page: () => const OnboardScreen(),
    ),
    //Auth
    // GetPage(
    //   name: Paths.signin,
    //   page: () => SigninScreen(),
    // ),
  ];
}
