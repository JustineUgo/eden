import 'package:eden/app/modules/home/controller/home_controller.dart';
import 'package:eden/app/modules/onboard/controller/onboard_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetHttpClient());

    Get.put(OnboardController());
    Get.put(HomeController());
  }
}
