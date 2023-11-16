import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetHttpClient());
    // Get.put(GetStorage());
    // Get.put(Logger());
    // Get.put(Defaults());

    // Get.put(StorageService(storage: Get.find<GetStorage>()));
    // Get.put(UIService());
  }
}
