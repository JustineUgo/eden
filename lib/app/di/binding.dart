import 'package:eden/app/data/provider/provider.dart';
import 'package:eden/app/modules/auth/controller/auth_controller.dart';
import 'package:eden/app/modules/home/controller/home_controller.dart';
import 'package:eden/app/modules/onboard/controller/onboard_controller.dart';
import 'package:eden/app/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetHttpClient());
    Get.put(GetStorage());

    Get.put(EdenProvider(client: Get.find<GetHttpClient>()));
    Get.put(StorageService(storage: Get.find<GetStorage>()));

    Get.put(OnboardController());
    Get.put(AuthController(storage: Get.find<StorageService>(), provider: Get.find<EdenProvider>()));
    Get.put(HomeController(provider: Get.find<EdenProvider>(), storage: Get.find<StorageService>()));
  }
}
